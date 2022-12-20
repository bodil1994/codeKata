def group_anagrams(words)
  # TODO: group anagrams
  group_arr = []
  words.each { |element|
    group_arr << {
      original: element,
      sorted: element.chars.sort(&:casecmp).join.downcase
    }
  }
  acronyms = []
  grouped = group_arr.group_by {|hash|hash[:sorted]}
  grouped.transform_values! do |values|

    tmp = values.flat_map(&:to_a)
     tmp = tmp.group_by(&:shift)
    tmp.transform_values! { |values| values.flatten(1) }
   tmp.transform_values!(&:uniq)
   acronyms << tmp[:original]
  end
  return acronyms
end


def test
 words =  ['cars', 'for', 'POTATOES', 'racs', 'four', 'scar', 'creams', 'SCREAM']
 group_anagrams(words)
end
