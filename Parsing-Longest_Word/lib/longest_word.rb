require 'open-uri'
require 'json'

def generate_grid(grid_size)
  grid = []
  # TODO: generate random grid of letter
  grid_size.times { grid << ("a".."z").to_a[rand(0..26)] }
  grid
end

#def run_game(attempt, grid, start_time, end_time)
def run_game(attempt, grid)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  call_found = call_api(attempt)
  grid_letters = (attempt.chars.uniq - grid.uniq).empty?

  # initialize result hash
  result =  {}

  # word is in grid and english

  # word is in grid but not english

  # word is not in grid but english

  # word is not in grid and not english

  "he given word is not an english one"
  "the given word is not in the grid"
  "the given word has the correct letters but some letters are overused"

end

def call_api(attempt)
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  call_serialized = URI.open(url).read # returns String
  JSON.parse(call_serialized)["found"] # => returns hash - example: {"found"=>true, "word"=>"zt", "length"=>2}
end

def calculate_score(start_time, end_time, word)
  time_ms = (end_time - start_time).round * 60
  letters = word.grid_size
  score = (letters * 50 * 100) / time_ms
end
