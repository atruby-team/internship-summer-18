class HtmlToText
  def get_html(html)
    stack = []
    check = false
    @result = ''
    @arr = html.split('')
    i = 0
    while i < @arr.length
      if @arr[i..(i + 4)].join == '<div>'
        stack.push('div')
        if check == true
          @result << "\n"
          check == false
        end
        i += 5
      elsif @arr[i..(i + 3)].join == '<br>'
        if check == true
          @result << "\n"
          check == false
        end
        i += 4
      elsif @arr[i..(i + 5)].join == '</div>'
        if (stack.pop == 'div') && (check == true)
          @result << "\n"
          check = false
        end
        i += 6
      else
        @result << @arr[i]
        check = true
        i += 1
      end
    end
  end

  def show
    puts @result
  end
end

str = HtmlToText.new
str.get_html('<div><><div>Hello</div><div> Ruby</div></div><<<br>>><div>Will</div> be</div>Fun<p></p>')
str.show
