class HtmlToText
  def get_html html
    @html = html.is_a?(String) ? html : nil
  end

  def show_view
    @html.gsub!(/<div.*?>|<\/div>|<br>/, "\n")
  end
end

html = HtmlToText.new

code_html = "<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>"

html.get_html code_html

puts html.show_view

