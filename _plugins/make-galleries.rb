require 'rubygems'
require 'open-uri'
require 'time'
require 'yaml'
require 'to_slug'

Jekyll::Hooks.register :site, :pre_render do |site|

config = YAML.load_file('_config.yml')
gal = config["galleries"]
# later accept default overrides from config

image_location = "/assets/"
notes_location = "_notes/"
gallery_notes = "_galleries/"
collection_name = "_media/"
date_regex = /(\d{6})(?:-\d+)?\.[^.]+\z/

def extract_date(filename, regex)
  match = filename.match(regex)
  match&.captures&.first if match
end

everytag = []

gal.each do |galitem|
  gal_dir = galitem["directory"]
  gal_name = galitem["name"]
  gal_tags = galitem["tags"]


  date = galitem["date"]
  dateadded = Time.new
  name_slug = gal_name.to_slug.sub(/-\Z/,"")
  files_location = "#{site.source}#{image_location}#{gal_dir}/"
  output_location = "#{collection_name}#{gal_dir}/"

  # put all mds for images in _media/name bc it mirrors the assets dir
  # put all galleries in a _galleries collection, no notes, simple permalinks

  # make pages for every image in the specified directory #

  # make sure the gallery exists
  if File.exists?(files_location)

    # make gallery index #

    if gal_name

      # make sure the note that links to this gallery has somewhere to go
      unless File.exists?(gallery_notes)
        Dir.mkdir(gallery_notes)
      end

      # make an index page for this gallery

      indexname = "#{gallery_notes}#{name_slug}.md"
      unless File.exists?(indexname)
      newindex = File.new(indexname, "w+")
      newindex.puts "---"
      newindex.puts "title: #{gal_name}"
      newindex.puts "gallery: #{name_slug}"
      newindex.puts "layout: gallery"
      newindex.puts "--- \n"
      end
    else
      # add error message for galleries needing to have a name
    end
    
    # add flag to overwrite, or to delete notes with no file
    if !File.exist?(output_location)
      Dir.mkdir(output_location)
     end
    Dir.glob(['*.{jpg,jpeg,tiff,png,gif}'], base: files_location) do |f|
      thisdate = extract_date(f, date_regex) if date.nil?
      if !thisdate.nil?
        date_object = Date.strptime(thisdate, "%m%d%y")
        thisdate = date_object.strftime("%Y-%m-%d")
      else
      thisdate = dateadded
      end

     filename = "#{output_location}#{f.to_slug.sub(/-\Z/,"")}.md"
     if File.exist?(filename)
  			next
    	 else
    		file = File.new(filename, "w+")
    		file.puts "---"
    		file.puts "title: #{f}"
    		file.puts "date: #{thisdate}"
    		file.puts "dateadded: #{dateadded}"
    		file.puts "link: #{image_location}#{gal_dir}/#{f}"
    		file.puts "gallery: #{name_slug}"
    		file.puts "layout: asset"
    		file.puts "tags: #{gal_tags}"
    		file.puts "--- \n"
    		file.close
    	end
    end

    # set tags #
    gal_tags.each do |tag|
     everytag.push(tag) unless everytag.include?(tag)
    end

    # error if dir doesn't exist
    else
      Dir.mkdir(files_location)
      puts "The directory you defined did not exist, so one was created. No notes have been made."
    end
end


# make notes for new tags too. this should defo be cleaned up later
   everytag.each do |tagpage|
     tag_output = "#{notes_location}tags/"
      unless File.exists?(tag_output)
          Dir.mkdir(tag_output)
      end
        indexname = "#{tag_output}#{tagpage.to_slug.sub(/-\Z/,"")}.md"
        unless File.exists?(indexname)
        newindex = File.new(indexname, "w+")
 # later accept default overrides from config
       
          newindex.puts "---"
          newindex.puts "title: #{tagpage}"
          newindex.puts "layout: tag"
          newindex.puts "--- \n"
      end
      p "Handled tag: #{tagpage}"
  end

end
