module Jekyll
    class CustomTagsCategories < Generator
      safe true
      priority :low
  
      def generate(site)
        # Create arrays for unique tags and categories
        everytag = []
        everycat = []
  
        # Loop through all documents in the site
        site.documents.each do |document|
          # Extract tags and categories from the document's front matter
          document_tags = document.data['tags']
          document_categories = document.data['categories']
  
          # Add document's tags to everytag
          everytag.concat(document_tags) if document_tags.is_a?(Array)
  
          # Add document's categories to everycat
          everycat.concat(document_categories) if document_categories.is_a?(Array)
        end
  
        # Remove duplicates and sort the arrays
        everytag = everytag.uniq.sort
        everycat = everycat.uniq.sort
  
        # Add the arrays to site variables so they can be accessed in templates
        site.config['everytag'] = everytag
        site.config['everycat'] = everycat
      
  
        # Create blank index Markdown files for tags and categories
        create_blank_files(site, 'tag', 'tag_index_layout', 'tag_index_dir', everytag)
        create_blank_files(site, 'category', 'cat_index_layout', 'cat_index_dir', everycat)
      end
  
      private
  
      def create_blank_files(site, dir, layout_key, dir_key, items)
        items.each do |item|
          # Define the title for the page (use the item's name)
          title = item
  
          # Determine the layout for the page (default or from _config.yml)
          layout = site.config[layout_key] || "#{dir}_index"
  
          # Determine the directory for the page (default or from _config.yml)
          output_dir = site.config[dir_key] || "_#{dir}"
  
          # Determine the file path
          file_path = File.join(site.source, output_dir, "#{item}.md")
  
          # Check if the file already exists
          unless File.exist?(file_path)
            # Create a new blank Markdown file
            markdown_content = <<~MARKDOWN
              ---
              layout: #{layout}
              title: #{title}
              ---
            MARKDOWN
  
            # Write the Markdown content to the file
            File.open(file_path, 'w') { |file| file.write(markdown_content) }
          end
        end
      end
    end
    p "auto tag ended"
  end
  