class HtmlToText
  def initialize(html)
    @html = html
  end

  def get_html(html)
    flag = true
    stack = []
    len = html.length
    0.upto(len) do |i|
      html[i..i + 3] = "\n" if html[i..i + 3] == '<br>'
      if html[i..i + 4] == '<div>'
        stack.push(html[i..i + 4])
        if flag == true
          html[i..i + 4] = html[i..i + 4] == html[0..4] ? '' : "\n"
        end
      end
      next unless html[i..i + 5] == '</div>'
      html[i..i + 5] = flag == true && stack.pop == '<div>' ? "\n" : ''
      flag = false
      flag = true if html[i + 5..i + 9] != '<div>' || html[i + 5..i + 10] != '</div>'
    end
    html
  end

  def show_view
    puts get_html(@html)
  end
end

a = HtmlToText.new('<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<div><p></p>')
a.show_view
