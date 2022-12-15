def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  array.sort.partition { |element| element.size == size }
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  array.sort.partition { |element| yield(element) }
end

def test_size_splitter
  words = %w(dog data ask my win two beer as)
  result = size_splitter(words, 3)
end

def test_block_splitter
  beatles = [ "John", "Paul", "Ringo", "George" ]
  result = block_splitter(beatles) { |beatle| beatle.start_with?("P") }
end
