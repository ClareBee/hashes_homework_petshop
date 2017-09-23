def pet_shop_name(shop_name)
   shop_name[:name]
end

def total_cash(shop_name)
  shop_name[:admin][:total_cash]
end

def add_or_remove_cash(shop_name, money)
  cash = shop_name[:admin][:total_cash] += money
  # return cash
end

def pets_sold(shop_name)
  shop_name[:admin][:pets_sold]
end

def increase_pets_sold(shop_name, pet_sales)
  shop_name[:admin][:pets_sold] += pet_sales
end

def stock_count(shop_name)
  shop_name[:pets].count
end

def pets_by_breed(shop_name, type_of_dog)
  pets = []
  for pet in shop_name[:pets]
    if type_of_dog == pet[:breed]
    pets.push(type_of_dog)
    end
  end
  return pets
end

def find_pet_by_name(shop_name, name_of_pet)

  for pet in shop_name[:pets]
    if pet[:name] == name_of_pet
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop_name, name_of_pet)
  for pet in shop_name[:pets]
    if pet[:name] == name_of_pet
      shop_name[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop_name, new_pet_to_add)
  shop_name[:pets] << new_pet_to_add
  return stock_count(shop_name)
end


def customer_pet_count(customer_index)
  customer_index[:pets].count
end

def add_pet_to_customer(customer_index, new_pet_to_add)
    customer_index[:pets] << new_pet_to_add
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(shop_name, pet, customer)
  #find the pet in the shop
  for particular_pet in shop_name[:pets]
    if  particular_pet == pet && customer[:cash] > pet[:price]
      customer[:pets] << particular_pet
      shop_name[:admin][:pets_sold] += 1
      shop_name[:admin][:total_cash] += pet[:price]
    end
  end

end
