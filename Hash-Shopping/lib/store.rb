def store_items
  {
    yogurts: 2,
    meat: 7,
    vegetables: 5,
    potatoes: 2,
    rice: 1
  }
end

def product_in_store?(product)
  store_items.key?(product.to_sym)
end

def price_of_product(product)
  store_items[product.to_sym] if product_in_store?(product)
end

def store_items_to_s
  store_items.map { |key, value| "- #{key.to_s.capitalize}: #{value}€" }.join("\n")
end
