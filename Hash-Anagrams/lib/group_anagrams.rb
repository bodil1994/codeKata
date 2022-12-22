def group_anagrams(words)
  groups = {} # crash_word => words
  words.each do |word|
    crash_word = word.downcase.chars.sort.join
    if groups[crash_word]
      groups[crash_word] << word
    else
      groups[crash_word] = [word]
    end
  end
  groups.values
end

def test
 words =  ['cars', 'for', 'POTATOES', 'racs', 'four', 'scar', 'creams', 'SCREAM']
 group_anagrams(words)
end

# def group_anagrams(words)
#   # TODO: group anagrams
#   grouped = create_hash_array(words)
#   transform_hash_values(grouped)
# end

# def transform_hash_values(hash)
#   anagrams = []
#   hash.transform_values! do |values|
#     tmp = values.flat_map(&:to_a)
#     tmp = tmp.group_by(&:shift)
#     tmp.transform_values! { |values| values.flatten(1) }
#     tmp.transform_values!(&:uniq)
#     anagrams << tmp[:original]
#   end
#   return anagrams
# end

# def create_hash_array(words)
#   hash_array = []
#   words.each { |element|
#     hash_array << {
#       original: element,
#       sorted: element.chars.sort(&:casecmp).join.downcase
#     }
#   }
#   hash_array.group_by {|hash|hash[:sorted]}
# end
