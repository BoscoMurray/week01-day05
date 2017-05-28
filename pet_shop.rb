def pet_shop_name(name)
  return name[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  return shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, quantity_sold)
  return shop[:admin][:pets_sold] += quantity_sold
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  result = []

  for pet in shop[:pets]
    result << pet if pet[:breed] == breed
  end

  return result
end

def find_pet_by_name(shop, name)

  for pet in shop[:pets]
    result = pet if pet[:name] == name
  end

  return result
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    shop[:pets].delete(pet) if pet[:name] == name
  end
end

def add_pet_to_stock(shop, pet)
  shop[:pets] << pet
end

def customer_pet_count(customer)
  result = 0

  for pet in customer[:pets]
    result += 1
  end

  return result
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  return true if customer[:cash] - pet[:price] >= 0
  return false if customer[:cash] - pet[:price] < 0
end

def sell_pet_to_customer(shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    customer[:pets] << pet
    shop[:admin][:pets_sold] += 1
    shop[:admin][:total_cash] += pet[:price]
  end
end