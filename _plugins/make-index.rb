require 'json'

Jekyll::Hooks.register :documents, :post_write do |doc|
  # Create an array to hold all document objects
  all_documents = []

  # Loop through all site documents
  doc.site.documents.each do |document|
    # Create a hash for the current document with 'id' attribute
    # set to the permalink
    document_hash = { 'id' => document.url }

    # Add the front matter data to the document hash
    document_hash.merge!(document.data)

    # Add the document hash to the all_documents array
    all_documents << document_hash
  end

  # Generate the JSON content
  json_content = JSON.pretty_generate(all_documents)

  # Save the JSON content to a file named 'site-index.js' in the root directory
  File.write(File.join(doc.site.dest, 'site-index.json'), " #{json_content}")
end
