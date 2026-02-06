module Jekyll
  class GithubAlertsConverter
    def convert(content)
      # Convert [!NOTE], [!WARNING], etc. to proper HTML with data-type attribute
      # Matches blockquote with [!TYPE] at the start
      content.gsub!(%r{<blockquote>\s*<p>\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\](.+?)</p>}, 
                   '<blockquote data-type="\1.downcase">\n<p>\2</p>')
      
      content.gsub!(%r{<blockquote>\s*<p>\[!(note|tip|important|warning|caution)\](.+?)</p>}, 
                   '<blockquote data-type="\1">\n<p>\2</p>')
      
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
