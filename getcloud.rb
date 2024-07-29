require 'net/http'
require 'uri'
require 'nokogiri'
require 'dotenv/load'
require 'safe_yaml'

# Load environment variables
username = ENV['OWNCLOUD_USERNAME']
password = ENV['OWNCLOUD_PASSWORD']
owncloud = "https://cloud.mmmx.cloud"

# Load album configurations from config.yml
config = YAML.safe_load(File.read('_config.yml'), permitted_classes: [Date])
albums = config['albums']

# Helper method to perform HTTP requests with basic auth
def perform_request(url, username = nil, password = nil)
  uri = URI(url)
  request = Net::HTTP::Propfind.new(uri)
  request.basic_auth(username, password) if username && password

  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  response.body if response.is_a?(Net::HTTPSuccess)
end

# Process each album and collect image URLs
photo_data = albums.map do |album|
  response = perform_request(album['public_url'])
  if response
    doc = Nokogiri::XML(response)
    doc.remove_namespaces!
    photos = doc.xpath('//response').map do |node|
      owncloud+node.at('href').text
    end
    { 'name' => album['name'], 'photos' => photos }
  else
    { 'name' => album['name'], 'photos' => [] }
  end
end

# Output the photo data to a YAML file
File.open('_data/photos.yml', 'w') do |file|
  file.write(photo_data.to_yaml)
end

# Generate markdown files for each album
photo_data.each do |album|
  front_matter = <<-HEREDOC
---
layout: pwncloud
title: #{album['name']}
album_name: #{album['name']}
---
  HEREDOC

  File.open("_galleries/#{album['name'].downcase.gsub(' ', '_')}.md", 'w') do |file|
    file.write(front_matter)
  end
end
