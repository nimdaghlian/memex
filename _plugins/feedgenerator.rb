require 'json'
require 'open-uri'
require 'rss'

module Jekyll
  class RSSFeedGenerator < Generator
    safe true
    priority :low

    def generate(site)
      feeds = site.config['rss_feeds']

      return if feeds.nil?
      # turned off for now
      return 

      rss_data = {}

      feeds.each do |feed_data|
        feed_name = feed_data['name']
        feed_url = feed_data['url']
        feed_tag = feed_data['tag']
        feed_slug = feed_data['slug']
        feed_mode = feed_data['mode']

        rss_data[feed_name] = {
          'tag' => feed_tag,
          'items' => []
        }

        URI.open(feed_url) do |rss|
          if feed_mode == "notes"

            this_output = "#{site.source}/_notes/feeds/"

            if feed_slug
              # make sure the feed pages have somewhere to go
              this_output += "#{feed_slug}/"
            end

            unless File.exists?(this_output)
              Dir.mkdir(this_output)
            end

            feed_source = RSS::Parser.parse(rss)
            # puts "Title: #{feed.channel.title}"
            feed_source.items.each do |item|
              # puts "Item: #{item.title}"
              title = item.title.encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '-')
              tags = feed_tag
              # if item.dc_subject
              #   tags += item.dc_subject.split(" ")
              # end
              description = "No Description"
              if item.description
                description = item.description
              end
              entry_url = item.link
              date = item.dc_date
              dateadded = Time.new
              date = dateadded if date.nil?
              filename = "#{this_output}#{title.to_slug.sub(/-\Z/,"")}.md"
              if File.exist?(filename)
                next
              else
                file = File.new(filename, "w+")
                file.puts "---"
                file.puts "title: > \n #{title}"
                file.puts "date: #{date}"
                file.puts "dateadded: #{dateadded}"
                file.puts "link: \"#{entry_url}\""
                file.puts "feed-slug: \"#{feed_slug}\""
                file.puts "feed-name: \"#{feed_name}\""
                file.puts "layout: urlnote"
                file.puts "tags: #{tags}"
                file.puts "--- \n"
                file.puts description
                file.puts " <!-- end excerpt --> \n"
                file.close
              end
            end
            p "#{feed_name} feed updated in #{feed_slug}"
          else
    
            feed = RSS::Parser.parse(rss)
            feed.items.each do |item|
              date = item.respond_to?(:pubDate) ? item.pubDate.strftime('%Y-%m-%d %H:%M:%S') : ''
              rss_data[feed_name]['items'] << {
                'date' => date,
                'link' => item.link,
                'description' => item.description
              }
            end 
          end
        end
      end

      # Output feeds.json to the source directory for debugging
      File.open(File.join(site.source, 'feeds.json'), 'w') do |f|
        f.write(JSON.pretty_generate(rss_data))
      end

      # Store the feeds data in site.data
      site.data['feeds'] = rss_data
    end
  end
end
