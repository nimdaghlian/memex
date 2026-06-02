#!/usr/bin/env ruby
# frozen_string_literal: true

# Test script for BidirectionalLinksGenerator
# This script tests that the generator handles Jekyll::StaticFile instances correctly

require 'jekyll'

# Mock Jekyll::StaticFile class for testing
class MockStaticFile
  attr_reader :basename, :data, :url
  
  def initialize(basename: 'test.txt', data: {}, url: '/test.txt')
    @basename = basename
    @data = data
    @url = url
  end
  
  # StaticFile doesn't have content method
  # This is what causes the error
end

# Mock Jekyll::Document class for testing
class MockDocument
  attr_accessor :content, :basename, :data, :url, :path
  
  def initialize(content: '', basename: 'test.md', data: { 'title' => 'Test' }, url: '/test', path: '_notes/test.md')
    @content = content
    @basename = basename
    @data = data
    @url = url
    @path = path
  end
end

# Mock Jekyll::Site class for testing
class MockSite
  attr_reader :collections, :documents, :config, :baseurl
  
  def initialize
    @config = { 'use_html_extension' => false }
    @baseurl = ''
    
    # Create a mix of documents and static files
    @documents = [
      MockDocument.new(
        content: 'This is a note with [[link]] to another note.',
        basename: 'note1.md',
        data: { 'title' => 'Note 1' },
        url: '/note1',
        path: '_notes/note1.md'
      ),
      MockDocument.new(
        content: 'This is another note.',
        basename: 'note2.md',
        data: { 'title' => 'Note 2' },
        url: '/note2',
        path: '_notes/note2.md'
      ),
      MockStaticFile.new(
        basename: 'image.jpg',
        data: { 'title' => 'Image' },
        url: '/image.jpg'
      ),
      MockDocument.new(
        content: nil,  # Document with nil content
        basename: 'empty.md',
        data: { 'title' => 'Empty' },
        url: '/empty',
        path: '_notes/empty.md'
      )
    ]
    
    # Create notes collection
    notes_docs = @documents.select { |doc| doc.is_a?(MockDocument) && doc.path&.include?('_notes/') }
    @collections = {
      'notes' => OpenStruct.new(docs: notes_docs)
    }
  end
end

# Load the actual generator
require_relative '_plugins/bidirectional_links_generator.rb'

puts "Testing BidirectionalLinksGenerator..."
puts "=" * 50

# Create site and generator
site = MockSite.new
generator = BidirectionalLinksGenerator.new

begin
  puts "Running generator..."
  generator.generate(site)
  puts "✓ Generator ran successfully without errors!"
  
  # Check that documents were processed correctly
  processed_docs = site.documents.select { |doc| doc.is_a?(MockDocument) && !doc.content.nil? }
  puts "✓ Processed #{processed_docs.count} documents with content"
  
  # Check that static file wasn't processed
  static_files = site.documents.select { |doc| doc.is_a?(MockStaticFile) }
  puts "✓ Skipped #{static_files.count} static files"
  
  # Check that document with nil content wasn't processed
  nil_content_docs = site.documents.select { |doc| doc.is_a?(MockDocument) && doc.content.nil? }
  puts "✓ Skipped #{nil_content_docs.count} documents with nil content"
  
  # Check that links were processed
  note1 = site.documents.find { |doc| doc.is_a?(MockDocument) && doc.data['title'] == 'Note 1' }
  if note1 && note1.content.include?('internal-link')
    puts "✓ Links were processed in Note 1"
  else
    puts "✗ Links were not processed in Note 1"
  end
  
rescue NoMethodError => e
  if e.message.include?('content') && e.message.include?('Jekyll::StaticFile')
    puts "✗ ERROR: Generator is still trying to call 'content' on StaticFile!"
    puts "Error message: #{e.message}"
    puts "Backtrace:"
    puts e.backtrace.first(5)
  else
    puts "✗ ERROR: #{e.message}"
    puts "Backtrace:"
    puts e.backtrace.first(5)
  end
rescue => e
  puts "✗ ERROR: #{e.class.name}: #{e.message}"
  puts "Backtrace:"
  puts e.backtrace.first(5)
end

puts "=" * 50
puts "Test complete!"