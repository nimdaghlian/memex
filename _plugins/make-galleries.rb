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

  ## Make pages for every image in the specified directory 

  # only run if the media directory exists
  if File.exists?(files_location)

    # make gallery index #

    if gal_name

      # make sure the note that links to this gallery has somewhere to go
      unless File.exists?(gallery_notes)
        Dir.mkdir(gallery_notes)
      end

      # make an index page for this gallery
      # Using proper names assumes that you're formatting the permalink correctly with :name to get the slug in config

      indexname = "#{gallery_notes}#{gal_name}.md"
      unless File.exists?(indexname)
      newindex = File.new(indexname, "w+")
      newindex.puts "---"
      newindex.puts "title: #{gal_name}"
      newindex.puts "gallery: #{name_slug}"
      # TODO think about other statuses, what to use them for
      newindex.puts "status: fresh"
      newindex.puts "categories: collection gallery"
      # TODO allow layout string to be set from config
      newindex.puts "layout: gallery"
      newindex.puts "--- \n"
      end
    else
    # TODO add error message for galleries needing to have a name
    end
    
    # TODO add flag to overwrite, or to delete notes with no file
    if !File.exist?(output_location)
      Dir.mkdir(output_location)
     end
    Dir.glob(['*.{jpg,jpeg,tiff,png,gif}'], base: files_location) do |f|
    
      ## Date Handling ##
    
      # If file name has an expected date pattern, set that as the date
      # only run if no date has been manually set from config
      # TODO allow regex to be set from config

      thisdate = extract_date(f, date_regex) if date.nil?
      # set format
      if !thisdate.nil?
        date_object = Date.strptime(thisdate, "%m%d%y")
        thisdate = date_object.strftime("%Y-%m-%d")
      else
      # set date as dateadded if there are no other sources for it
      thisdate = dateadded
      end
      fileslug = f.to_slug.sub(/-\Z/,"")
      filename = "#{output_location}#{fileslug}.md"

      # TODO flag to overwrite 
      if File.exist?(filename)
  			next
    	  
      else
    		file = File.new(filename, "w+")
    		file.puts "---"
    		file.puts "title: #{f}"
    		file.puts "date: #{thisdate}"
    		file.puts "dateadded: #{dateadded}"
    		file.puts "asset: #{image_location}#{gal_dir}/#{f}"
    		file.puts "image: #{image_location}#{gal_dir}/#{f}"
        # TODO check against a set of file extensions and label appropriately
        # This would be on the way to making a more generic "media collection" utility
        # so you'd want your template to detect the asset type / assign different template (less pref)
        file.puts "categories: media image"
        file.puts "gallery: #{name_slug}"
        # NOTE this is pretty jekyll specific, but specifying a permalink means that you could
        file.puts "permalink: /media/#{name_slug}/#{fileslug}"
    		file.puts "layout: asset"
    		file.puts "tags: #{gal_tags}"
    		file.puts "--- \n"
    		file.close

        # TODO output a json / yaml file that indexes all media files for pagination, indexing
        # TODO figure out the actual right time and place to do this. seems like a separate plugin
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



end
