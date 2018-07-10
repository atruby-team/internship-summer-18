module Channel
  def add_channel(list, *param)
    unless list.key?(param[0])
      list[param[0]] = { title: param[1], content: param[2], category: param[3] }
      return true
    end
    false
  end

  def update_channel(list, *param)
    if list.key?(param[0].id)
      list[param[0].id][:title] = param[1]
      list[param[0].id][:content] = param[2]
      return true
    end
    false
  end

  def delete_channel(list, id)
    list.delete(id) ? true : false
  end
end
