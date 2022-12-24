require 'open-uri'
require 'json'

def generate_grid(grid_size)
  grid = []
  # TODO: generate random grid of letter
  grid_size.times { grid << ("a".."z").to_a[rand(0..26)] }
  grid
end

#def run_game(attempt, grid, start_time, end_time)
def run_game(attempt)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  puts call_serialized = URI.open(url).read # returns String
  puts call = JSON.parse(call_serialized) # returns Hash

  if call["found"] == true &&
  "he given word is not an english one"
  "the given word is not in the grid"
  "the given word has the correct letters but some letters are overused"
  end
end

def grid_compliant?(word)
  word.chars.each {}
end
