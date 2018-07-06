class HtmlToText
  def get(html)
    stack = [], flag = false
    @action = ''
    @arr = html.split('')
    i = 0
    while i < @arr.length
      if @arr[i..(i + 4)].join == '<div>'
        stack.push('div')
        if flag == true
          @action << "\n"
          flag == false
        end
        i += 5
      elsif @arr[i..(i + 3)].join == '<br>'
        if flag == true
          @action << "\n"
          flag == false
        end
        i += 4
      elsif @arr[i..(i + 5)].join == '</div>'
        if (stack.pop == 'div') && (flag == true)
          @action << "\n"
          flag = false
        end
        i += 6
      else
        @action << @arr[i]
        flag = true
        i += 1
      end
    end
  end

  def show
    puts @action
  end
end
a = HtmlToText.new
a.get('<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>')
a.show
