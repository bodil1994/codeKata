def add_to_cart(cart, product)
  cart << product
end

def cart_to_s(cart)
  cart_h = cart.group_by(&:itself).transform_values(&:count) #=  cart.group_by { |e| e } .transform_values {|e|e.count}
  cart_h.map { |key, value| "#{key} x #{value}" }.join(", ")
  # alternative:  cart.map { |item| cart.count(item) > 1 ? "#{item} x #{cart.count(item)}" : item }.uniq.join(',')
end

def cart_total_price(cart, store_items)
  total = 0
  cart.each do |e|
    total += store_items[e.to_sym] if store_items[e.to_sym]
  end
  total
end
