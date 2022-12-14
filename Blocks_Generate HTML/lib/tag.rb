def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #  The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  "<#{tag_name}>"+ yield + "</#{tag_name}>"
end

tag('h1') do
  'Some Title'
end
