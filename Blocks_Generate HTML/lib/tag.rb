def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #  The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  name_value = attributes == nil ? nil : " #{attributes[0]}=\"#{attributes[1]}\""
  "<#{tag_name}#{name_value}>" + yield + "</#{tag_name}>"
end
