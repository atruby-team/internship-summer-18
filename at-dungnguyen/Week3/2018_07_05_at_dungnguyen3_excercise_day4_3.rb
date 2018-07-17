class HtmlToText
  def initialize(html)
    @html = html
  end

  def get_html(html)
    flag = false
    stack = []
    len = html.length
    0.upto(len) do |i|
      if html[i..(i + 3)] == '<br>'
        html[i..(i + 3)] = "\n"
      elsif html[i..(i + 4)] == '<div>'
        stack.push('<div>')
        html[i..(i + 4)] = flag ? "\n" : ''
        flag = true
      elsif html[i..(i + 5)] == '</div>'
        html[i..(i + 5)] = flag && stack.pop == '<div>' ? "\n" : ''
        flag = false
      else
        flag = true
      end
    end
    html
  end

  def show_view
    puts get_html(@html)
  end
end

a = HtmlToText.new('<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<div><p></p>')
a.show_view
