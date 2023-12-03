module Jekyll
    class RawMarkdownGenerator < Generator
      def generate(site)
        # Iterate through all documents in the site
        site.documents.each do |document|
          # Read the raw content of the Markdown file
          content = File.read(document.path)
  
          # Extract front matter and raw Markdown content
          front_matter_regex = /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
          match = content.match(front_matter_regex)
  
          if match
            # Filter out front matter and get the raw Markdown content
            raw_markdown = content.sub(match[0], '')
          else
            # If no front matter found, consider the entire content as raw Markdown
            raw_markdown = content
          end
  
          # Add raw markdown content to the document's data
          document.data['raw_markdown'] = raw_markdown
        end
      end
    end
  end
  