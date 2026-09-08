require 'set'
require 'shellwords'
require 'pathname'

# Sets `last_modified` and `first_published` on every document from git history,
# so a fresh checkout (where every file shares one mtime) still reports real
# per-file dates. Falls back to filesystem mtime for files git doesn't know about
# (new/untracked notes), and front matter always wins if it sets either key.
module MemexGitDates
  def self.history(site)
    @history ||= begin
      dates = {}
      out = `git -C #{site.source.shellescape} log --format='C%ct' --name-only --diff-filter=AMR 2>/dev/null`
      if $?.success?
        commit = nil
        out.each_line do |line|
          line = line.strip
          next if line.empty?
          if line.start_with?('C') && line[1..] =~ /\A\d+\z/
            commit = Time.at(line[1..].to_i)
          elsif commit
            # git log walks newest -> oldest, so first sighting is the last
            # modification and the final one is the first publication.
            entry = (dates[line] ||= { 'last_modified' => commit })
            entry['first_published'] = commit
          end
        end
      end
      dates
    end
  end

  # Files with uncommitted edits should report the working copy's mtime, not
  # the date of their last commit.
  def self.dirty(site)
    @dirty ||= begin
      out = `git -C #{site.source.shellescape} status --porcelain 2>/dev/null`
      $?.success? ? out.each_line.map { |l| l[3..].to_s.strip.split(' -> ').last }.compact.to_set : Set.new
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
