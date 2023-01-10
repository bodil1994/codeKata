require 'open-uri'
require 'json'

def generate_grid(grid_size)
  grid = []
  # TODO: generate random grid of letter
  grid_size.times { grid << ("a".."z").to_a[rand(0..26)] }
  grid

  # OR Array.new(grid_size) { ('A'..'Z').to_a.sample }
end

def included?(attempt, grid)
  attempt.chars.all? { |letter| attempt.count(letter) <= grid.count(letter) }
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  p call_found = call_api(attempt)
  p attempt
  p grid = grid.each(&:downcase!)

  # initialize result hash
  result = {
    time: end_time - start_time
  }

 if included?(attempt, grid)
    if call_found
      result[:score] = calculate_score(start_time, end_time, attempt)
      result[:message] = "Well Done!"
    else
      result[:score] = 0
      result[:message] = "not an english word"
    end
  else
    result[:score] = 0
    result[:message] = "not in the grid"
  end
  result
end

def call_api(attempt)
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  call_serialized = URI.open(url).read # returns String
  JSON.parse(call_serialized)["found"] # => returns hash - example: {"found"=>true, "word"=>"zt", "length"=>2}
end

def calculate_score(start_time, end_time, word)
  time_ms = (end_time - start_time).round * 60
  letters = word.size
  score = (letters * 50 * 100) / time_ms
end
