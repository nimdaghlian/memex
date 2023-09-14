require 'fileutils'
require 'yaml'
require 'stringex' # Gem for slugify

# Custom slugify function that does not truncate long titles
def custom_slugify(input)
  input.downcase.strip.gsub(/\s+/, '-').to_url
end

def copy_and_process_files(source_dir, target_dir)
  Dir.glob(File.join(source_dir, '**', '*')).each do |source_file|
    target_file = source_file.sub(source_dir, target_dir)
    
    if File.directory?(source_file)
      FileUtils.mkdir_p(target_file)
    else
      if source_file =~ /\.md$/i
        process_markdown_file(source_file, target_file)
      else
        copy_with_mtime_check(source_file, target_file)
      end
    end
  end
end

def copy_with_mtime_check(source_file, target_file)
  if File.exist?(target_file) && File.mtime(target_file) >= File.mtime(source_file)
    puts "Skipped: #{target_file} is newer than the source file."
  else
    FileUtils.cp(source_file, target_file)
  end
end

def process_markdown_file(source_file, target_file)
  content = File.read(source_file)
  front_matter_match = content.match(/---\s*\n(.*?\n)---\s*\n(.*)/m)

  if front_matter_match
    front_matter = YAML.load(front_matter_match[1]) || {}
    content_without_front_matter = front_matter_match[2]
  else
    front_matter = {}
    content_without_front_matter = content
  end

  filename = File.basename(source_file, '.*')
  layout = source_file.include?('/collections/') ? 'collection' : 'note'
  
  front_matter['title'] ||= filename
  front_matter['layout'] ||= layout
  
  new_content = front_matter.to_yaml + "---\n" + content_without_front_matter
  
  # Check if the file is not in the "assets" directory before slugifying
  unless source_file.include?('/assets/')
    target_filename = custom_slugify(filename)
    target_filename = target_filename.gsub('/assets/', '/')
    
    # Combine the target directory and the slugified filename
    target_file_path = File.join(File.dirname(target_file), "#{target_filename}.md")
    
    # Ensure the target directory exists
    FileUtils.mkdir_p(File.dirname(target_file_path))
    
    # Overwrite the file, or create it if it doesn't exist
    File.write(target_file_path, new_content)
  end
end

source_directory = ARGV[0] || '/Users/nim/dev/test/source'
target_directory = ARGV[1] || '/Users/nim/dev/test/target'

copy_and_process_files(source_directory, target_directory)




p "Done"