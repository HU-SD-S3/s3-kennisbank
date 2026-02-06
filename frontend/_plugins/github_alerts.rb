module Jekyll
  class GithubAlertsConverter
    def convert(content)
      # Convert [!NOTE], [!WARNING], etc. to proper HTML
      content.gsub!(/<blockquote>\n<p>\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\](.*?)<\/p>\n(.*?)<\/blockquote>/m) do |match|
        alert_type = $1.downcase
        rest = $3
        
        %(<blockquote data-type="#{alert_type}">#{rest}</blockquote>)
      end
      
      content
    end
  end
end

Jekyll::Hooks.register :pages, :post_convert do |page|
  converter = Jekyll::GithubAlertsConverter.new
  page.content = converter.convert(page.content)
end

Jekyll::Hooks.register :posts, :post_convert do |post|
  converter = Jekyll::GithubAlertsConverter.new
  post.content = converter.convert(post.content)
end
