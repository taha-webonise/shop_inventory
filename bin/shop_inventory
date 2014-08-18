#!/usr/bin/env ruby

require "shop_inventory"
$exit = false
until $exit
  print "\n\nEnter your choice:\n1. for ShopKeeper\n2. for User\n3. List products\n4. Search a product\n5. Exit\n\n"
  person = Integer($stdin.gets.chomp)

  if person == 1
    print "\n\nOptions\n1. Add product\n2. Remove product\n3. List products\n4. Search a product\n5. Edit any product\n6. Exit\n\n"
    option = Integer($stdin.gets.chomp)
    user = Shopkeeper.new
    if option == 1
  	  print "Enter product name: "
  	  product_name = $stdin.gets.chomp
  	  print "Enter price: "
  	  price = Integer($stdin.gets.chomp)
  	  print "Enter stock: "
  	  stock = Integer($stdin.gets.chomp)
  	  print "Enter company name: "
  	  company_name = $stdin.gets.chomp
  	  user.add_product(product_name: product_name, price: price, stock_item: stock, company_name: company_name)
    elsif option == 2
    	print "Enter product id that you want to remove: "
  	  product_id = Integer($stdin.gets.chomp)
  	  user.remove_product(product_id)
    elsif option == 3
  	  Shopkeeper.list_product
    elsif option == 4
  	  print "Enter product name you want to search: "
  	  product_name = $stdin.gets.chomp
  	  Shopkeeper.search_product(product_name)
    elsif option == 5
	    print "Enter product id that you want to edit: "
  	  product_id = Integer($stdin.gets.chomp)
  	  print "Enter new product name: "
  	  product_name = $stdin.gets.chomp
  	  print "Enter new price: "
  	  price = Integer($stdin.gets.chomp)
  	  print "Enter new stock: "
  	  stock = Integer($stdin.gets.chomp)
  	  print "Enter new company name: "
  	  company_name = $stdin.gets.chomp
  	  user.edit_product(product_id, product_name, price, stock, company_name)
    elsif option == 6
      $exit = true
    else
  	  abort("Wrong option chosen. Please try again!")
    end
  elsif person == 2
    print "Options\n1. List products\n2. Search products\n3. Buy products\n4. Exit\n"
    option = Integer($stdin.gets.chomp)
    user = User.new
    if option == 1
      User.list_product
    elsif option == 2
      print "Enter product name you want to search: "
      product_name = $stdin.gets.chomp
      User.search_product(product_name)
    elsif option == 3
      print "Enter your name: "
      name = $stdin.gets.chomp
      print "Enter product id of the product you want to buy: "
      product_id = Integer($stdin.gets.chomp)
      print "Enter credit card number: "
      credit_card = Integer($stdin.gets.chomp)
      print "Enter CVV number: "
      cvv_number = Integer($stdin.gets.chomp)
      user.buy(product_id: product_id, user_name: name, credit_card: credit_card, cvv: cvv_number)
    elsif option == 4
      $exit = true
    else
      abort("Wrong option chosen. Please try again!")
    end
  elsif person == 3
    Shopkeeper.list_product
  elsif person == 4
    print "Enter product name you want to search: "
    product_name = $stdin.gets.chomp
    Shopkeeper.search_product(product_name)
  elsif person == 5
    $exit = true
  else
    abort("Wrong option chosen. Please try again!")
  end
end