
module Jekyll

    module CustomFilter
      def custom_html(title, style = "image", excerpt = false)
        # Find the document with the specified title among all documents in the site
        document = @context.registers[:site].documents.find { |doc| doc.data["title"] == title }
        require 'jekyll-resize' # Load the 'resize' filter

        if document
          case style
          when "image"
            image_src = document.data["image"]
            title_attr = document.data["title"]
            link_url = document.url
  
            if excerpt
              alt_attr = document.data["excerpt"]
            else
              alt_attr = title_attr
            end
  
            "<a href=\"#{link_url}\"><img src=\"#{image_src}\" alt=\"#{alt_attr}\" title=\"#{title_attr}\"></a>"
          
        when "block"

            output = <<-HTML
                <div class="card block" >
                <div class="card-header page_hilight_bg">
                    <div class="desaturate page_hilight">
                        HTML


                 if document.data["date"]
                    date = document.data["date"]
                    formatted_date = date.strftime("%Y-%m-%d %H:%M:%S")
                    output += "<span class='date'><small>#{formatted_date}</small></span>"
                  end
                
                
                output +="</div></div>"
                
                if document.data["image"]
                    image_url = document.data["image"]
                output += "<div class='content'>
                <div style='background-image: url({{ #{image_url} | resize: '400>x400'}}); margin: auto; height: 200px; background-repeat: no-repeat; background-position: center; background-size: cover;'>
                <a href='#{document.data["url"]}?gallery=#{document.data["gallery"]}' target='_blank' title='#{document.data["title"]}' style='width: 100%; height: 200px; display: block;'></a>
                </div>
                <h3>
                  <a href='#{document.data["url"]}?gallery=#{document.data["gallery"]}' target='_blank' title='#{document.data["title"]}' class='card-link page_hilight'>#{document.data["title"]}</a>
                </h3>"

                if document.data["excerpt"]
                  output += "<div>{{ #{document.data["excerpt"]} | truncatewords: 25 }}</div>"
                end
                output +="</div></div>"
                end
                output
          else
            # Handle unknown style
            ""
          end
        else
          # Handle the case where the document with the specified title is not found
          ""
        end
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::CustomFilter)
  