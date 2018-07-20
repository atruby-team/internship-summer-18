class HtmlToText
  def get_html(html)
    arr_char = html.split('')
    @string = ''
    stack = []
    i = 0
    check = false
    while i < arr_char.length
      if arr_char[i..i + 4].join == '<div>'
        stack.push('div')
        if check == true
          @string += "\n"
          check = false
        end
        i += 5
      elsif arr_char[i..i + 3].join == '<br>'
        @string += "\n"
        check = false
        i += 3
      elsif arr_char[i..i + 5].join == '</div>'
        if stack.pop == 'div' && check == true
          @string += "\n"
          check = false
        end
        i += 6
      else
        @string += arr_char[i]
        check = true
        i += 1
      end
    end
  end

  def show_view
    puts @string
  end
end

obj = HtmlToText.new
obj.get_html('<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>')
obj.show_view
