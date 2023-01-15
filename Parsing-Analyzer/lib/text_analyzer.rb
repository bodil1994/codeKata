#resource: https://rubular.com/

def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  puts result = {
    character_count: character_count(text),
    character_count_excluding_spaces: character_count_excluding_spaces(text),
    line_count: line_count(text),
    word_count: word_count(text),
    sentence_count: sentence_count(text),
    paragraph_count: paragraph_count(text),
    average_words_per_sentence: average_words_per_sentence(text),
    average_sentences_per_paragraph: average_sentences_per_paragraph(text)
  }

end

def character_count(text)
  text.length
end

def character_count_excluding_spaces(text)
  text.gsub(" ","").length
end

def line_count(text)
  text.scan(/^/).count
end

def word_count(text)
  text.scan(/\w+/).count
end

def sentence_count(text)
  text.scan(/[.]/).count
end

def paragraph_count(text)
  text.scan(/\n\n/).count + 1
end

def average_words_per_sentence(text)
  word_count(text).to_f / sentence_count(text)
end

def average_sentences_per_paragraph(text)
  sentence_count(text).to_f / paragraph_count(text)
end
