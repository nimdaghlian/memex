require 'set'
require 'json'
require 'shellwords'
require 'pathname'

# Sets `last_modified` and `first_published` on every document.
#
# File.mtime is useless here: a fresh checkout gives every file the same
# timestamp, so every note reported the build date. Git history has the real
# per-file dates, but Render clones with --depth=1 and that history is missing
# at deploy time. So we read git history whenever it is actually available
# (i.e. locally) and cache the result to a committed JSON file, which the
# shallow deploy build then reads instead.
module MemexGitDates
  CACHE = '_data/file_dates.json'.freeze

  def self.git(site, args)
    out = `git -C #{site.source.shellescape} #{args} 2>/dev/null`
    # Backticks inherit the build's locale, which on some hosts is ASCII; paths
    # in this repo are not.
    $?.success? ? out.force_encoding(Encoding::UTF_8) : nil
  end

  def self.shallow?(site)
    git(site, 'rev-parse --is-shallow-repository').to_s.strip == 'true'
  end

  # => { "path" => { "last_modified" => Time, "first_published" => Time } }
  def self.history(site)
    return @history if defined?(@history)

    @history = if shallow?(site)
      Jekyll.logger.warn 'Dates:', 'shallow clone, reading dates from cache'
      from_cache(site)
    else
      dates = from_git(site)
      write_cache(site, dates) if dates.any?
      dates
    end
  end

  def self.from_git(site)
    dates = {}
    # -z keeps paths raw; without it git octal-escapes and quotes any path with
    # non-ASCII or spaces, which then never matches a document's real path.
    log = git(site, "log -z --format='C%ct' --name-only --diff-filter=AMR")
    return dates unless log

    commit = nil
    log.split("\0").each do |line|
      line = line.strip
      next if line.empty?
      if line.start_with?('C') && line[1..] =~ /\A\d+\z/
        commit = Time.at(line[1..].to_i)
      elsif commit
        # git log walks newest -> oldest, so the first sighting of a path is
        # its last modification and the final one is its first publication.
        entry = (dates[line] ||= { 'last_modified' => commit })
        entry['first_published'] = commit
      end
    end
    dates
  end

  def self.from_cache(site)
    path = File.join(site.source, CACHE)
    return {} unless File.exist?(path)

    JSON.parse(File.read(path)).each_with_object({}) do |(file, times), out|
      out[file] = {
        'last_modified' => Time.at(times['last_modified']),
        'first_published' => Time.at(times['first_published'])
      }
    end
  rescue JSON::ParserError => e
    Jekyll.logger.warn 'Dates:', "could not read #{CACHE}: #{e.message}"
    {}
  end

  # Only ever written from a full clone, so a shallow deploy build can't
  # clobber the cache with dates it doesn't actually know.
  def self.write_cache(site, dates)
    path = File.join(site.source, CACHE)
    payload = dates.sort.to_h { |file, times|
      [file, { 'last_modified' => times['last_modified'].to_i,
               'first_published' => times['first_published'].to_i }]
    }
    json = JSON.pretty_generate(payload)
    return if File.exist?(path) && File.read(path) == json

    File.write(path, json)
    Jekyll.logger.info 'Dates:', "refreshed #{CACHE} (commit it so deploys stay current)"
  end

  # Files with uncommitted edits should report the working copy's mtime rather
  # than the date of their last commit.
  def self.dirty(site)
    @dirty ||= begin
      status = git(site, 'status --porcelain')
      status ? status.each_line.map { |l| l[3..].to_s.strip.split(' -> ').last }.compact.to_set : Set.new
    end
  end
end

Jekyll::Hooks.register :site, :pre_render do |site|
  history = MemexGitDates.history(site)
  root = Pathname.new(site.source)

  site.documents.each do |document|
    next unless document.path

    relative = begin
      Pathname.new(document.path).relative_path_from(root).to_s
    rescue ArgumentError
      nil
    end

    dates = history[relative] || {}
    mtime = File.mtime(document.path) if File.exist?(document.path)

    last_modified = dates['last_modified']
    last_modified = mtime if mtime && (last_modified.nil? || MemexGitDates.dirty(site).include?(relative))

    document.data['last_modified'] ||= last_modified
    document.data['first_published'] ||= dates['first_published'] || document.data['date'] || mtime
  end
end
