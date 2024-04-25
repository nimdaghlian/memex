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

      rss_data = {}

      feeds.each do |feed_data|
        feed_name = feed_data['name']
        feed_url = feed_data['url']
        feed_tag = feed_data['tag']

        rss_data[feed_name] = {
          'tag' => feed_tag,
          'items' => []
        }

        URI.open(feed_url) do |rss|
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

      # Output feeds.json to the source directory for debugging
      File.open(File.join(site.source, 'feeds.json'), 'w') do |f|
        f.write(JSON.pretty_generate(rss_data))
      end

      # Store the feeds data in site.data
      site.data['feeds'] = rss_data
    end
  end
end
