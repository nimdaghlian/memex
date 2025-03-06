require 'json'
require 'builder'

Jekyll::Hooks.register :site, :post_write do |site|
  # Create an array to hold all document objects
  all_documents = []
  def write_file(dest, url, extension, content)
    # Write file to the output directory
    path = File.join(dest, url.gsub(/\.html$/, ".#{extension}"))
    FileUtils.mkdir_p(File.dirname(path))
  end
  # Loop through all site documents
  site.documents.each do |document|

        
    if File.exist?(document.path)
      last_modified = File.mtime(document.path)
    end
    # document.data['last_modified'] = last_modified
    # Create a hash for the current document with 'id' attribute
    # set to the permalink
    document_hash = { 'id' => document.url }

    # Exclude the 'backlinks' key from the document.data hash
      document_data = document.data.reject! { |key| key == 'backlinks' }
      document_front_matter = document.data.reject! { |key| key == 'raw_markdown' }
      document_content = document.data["raw_markdown"]
      # Add the front matter data to the document hash
    document_hash.merge!(document.data)

    # Add the document hash to the all_documents array
    all_documents << document_hash
     # Generate raw Markdown file
  #    content = <<~MARKDOWN
  #    ---
  #    #{document_data.to_yaml}
  #    ---
  #    #{document_content}
  #  MARKDOWN
  #  write_file(site.dest, document.url, "md", content)
  # Remove the "backlinks" key from each hash in the all_documents array
  # all_documents.each { |document| document.delete('backlinks') }
  end
    

  # Generate the JSON content
  json_content = JSON.pretty_generate(all_documents)

  # Add to site dest manually because this definitely must be excluded in the build
  File.write(File.join(site.dest, 'site-index.json'), json_content)


  # Save a copy to the '_data' directory
  File.write(File.join(site.source, '_data', 'site-index.json'), json_content)
  p "make-index ended"
end

