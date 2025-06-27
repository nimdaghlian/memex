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

  # only run if the media directory exist
  if File.exist?(files_location)

    # make gallery index #

    if gal_name

      # make sure the note that links to this gallery has somewhere to go
      unless File.exist?(gallery_notes)
        Dir.mkdir(gallery_notes)
      end

      # make an index page for this gallery
      # Using proper names assumes that you're formatting the permalink correctly with :name to get the slug in config

      indexname = "#{gallery_notes}#{gal_name}.md"
      unless File.exist?(indexname)
      newindex = File.new(indexname, "w+")
      newindex.puts "---"
      newindex.puts "title: #{gal_name}"
      newindex.puts "gallery: #{name_slug}"
      # TODO think about other statuses, what to use them for
      newindex.puts "status: fresh"
      newindex.puts "categories: album"
      # TODO allow layout string to be set from config
      # newindex.puts "layout: gallery"
      newindex.puts "--- \n"
      end
    else
    # TODO add error message for galleries needing to have a name
    end

    # TODO add flag to overwrite, or to delete notes with no file
    if !File.exist?(output_location)
      Dir.mkdir(output_location)
     end


    # TODO possibly set these from config too, but ¯\_(ツ)_/¯
    # File types to match and how to categorize them
    file_types = {
      'jpg' => 'image',
      'jpeg' => 'image',
      'tiff' => 'image',
      'png' => 'image',
      'gif' => 'image',
      'mp4' => 'video',
      'm4v' => 'video',
      'webm' => 'video',
      'mp3' => 'audio',
      'wav' => 'audio',
      'mpeg' => 'audio',
      'ogg' => 'audio'
    }

    accepted_extensions = file_types.keys.join(',')

    Dir.glob(['*.{'+ accepted_extensions +'}'], base: files_location) do |f|
      extension = File.extname(f).downcase.tr(".","")
      file_type = file_types[extension]
      if file_type

        ## Date Handling ##

        # If file name has an expected date pattern, set that as the date
        # only run if no date has been manually set from config
        # TODO allow regex to be set from config

        thisdate = extract_date(f, date_regex) if config["parse_date"]

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

        # TODO config flag to overwrite
        if File.exist?(filename)
          next

        else
          file = File.new(filename, "w+")
          file.puts "---"
          file.puts "title: #{f}"
          file.puts "date: #{thisdate}"
          file.puts "dateadded: #{dateadded}"
          file.puts "asset: #{image_location}#{gal_dir}/#{f}"
          if file_type == "video" || file_type == "audio"
          file.puts "encoding: #{extension}"
          end
          if file_type == "image"
          file.puts "image: #{image_location}#{gal_dir}/#{f}"
          end
          # TODO check against a set of file extensions and label appropriately
          # This would be on the way to making a more generic "media collection" utility
          # so you'd want your template to detect the asset type / assign different template (less pref)
          file.puts "categories: #{file_type}"
          file.puts "gallery: #{name_slug}"
          # NOTE this is pretty jekyll specific but specifying a permalink is pretty handy
          # TODO however it doesn't work with subdirectories yet as it allows for naming separate from directory name
          file.puts "permalink: /media/#{name_slug}/#{fileslug}"
          file.puts "layout: asset"
          file.puts "tags: #{gal_tags}"
          file.puts "--- \n"
          file.close

          # TODO output a json / yaml file that indexes all media files for pagination, indexing
          # TODO figure out the actual right time and place to do this. seems like a separate plugin
        end

      else
        puts "#{f} has an unsupported extension."
      end
    end


    Dir.glob(['*.{jpg,jpeg,tiff,png,gif,mov,mp3,mp4,wav,mpeg,aiff,webm,avi}'], base: files_location) do |f|


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


p "processed galleries"
end
