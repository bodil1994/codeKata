require 'open-uri'
require 'json'

def generate_grid(grid_size)
  grid = []
  # TODO: generate random grid of letter
  grid_size.times { grid << ("a".."z").to_a[rand(0..26)] }
  grid
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  p attempt = attempt.downcase
  p grid = grid.each(&:downcase!)
  p call_found = call_api(attempt)
  p grid_letters = (attempt.chars.uniq - grid.uniq).empty?
  p grid_letters_dup = attempt.chars.uniq.size != attempt.chars.size

  # initialize result hash
  result = {
    time: end_time - start_time
  }

  # word is in grid and english
  if call_found
    if grid_letters && grid_letters_dup
      result[:score] = calculate_score(start_time, end_time, attempt)
      result[:message] = "the given word has the correct letters but some letters are overused"
    elsif grid_letters
      result[:score] = calculate_score(start_time, end_time, attempt)
      result[:message] = "Well Done!"
    else
      result[:score] = 0
      result[:message] = "the given word is not in the grid"
    end
  else
    result[:score] = 0
    result[:message] = "not an english word"
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
