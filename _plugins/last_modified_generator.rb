require 'builder'
Jekyll::Hooks.register :site, :pre_render do |site|


  # Loop through all site documents
  site.documents.each do |document|

        
    if File.exist?(document.path)
      last_modified = File.mtime(document.path)
    end
    document.data['last_modified'] = last_modified
    
end
p "last mod ended"

end

