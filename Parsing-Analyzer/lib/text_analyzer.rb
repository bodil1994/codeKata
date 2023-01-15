def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  puts result = {
    character_count: character_count(text),
    character_count_excluding_spaces: character_count_excluding_spaces(text)
  }

end

def character_count(text)
  text.length
end

def character_count_excluding_spaces(text)
  text.gsub(" ","").length
end
