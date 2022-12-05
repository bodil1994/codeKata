def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  # split number into array
  digits = number.to_s.chars.map(&:to_i) # create an array of digits
  products = digit_subset_products(digits)
  products == products.uniq

end

def digit_subset_products(digits)
  products = []
  (1..digits.size).each do |i|
    (0..(digits.size - i)).each do |j|
      product = 1
      digits[j...(j + i)].each do |digit_subset|
        puts product = product * digit_subset
      end
      products << product
    end
  end
  products
end
