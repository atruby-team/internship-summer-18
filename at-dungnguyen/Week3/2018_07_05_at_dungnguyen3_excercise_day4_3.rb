class HtmlToText
  def initialize(html)
    @html = html
  end

  def get_html(html)
    html.gsub(%r{<\/?[div br]*>}, "\n")
  end

  def show_view
    puts get_html(@html)
  end
end

a = HtmlToText.new('<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>')
a.show_view
