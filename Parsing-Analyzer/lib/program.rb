require_relative 'text_analyzer'

# read text file
text = File.read("lib/text.txt")

analyze(text)
