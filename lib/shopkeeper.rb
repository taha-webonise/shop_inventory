#!/usr/bin/env ruby

$LOAD_PATH << "."
require "shop"
require "csv"

class Shopkeeper
  include Shop
  def add_product(details = {})
    if File.exist?('shopInventory.csv')
      CSV.open("shopInventory.csv","a+") do |product|
        timestamp = Time.now.strftime('%Y%m%d%H%M%S%L')
        product << [timestamp, details[:product_name], details[:price], details[:stock_item], details[:company_name]]
  	  end
    else
      CSV.open("shopInventory.csv","a+") do |product|
        product << ["product_id", "product_name", "price", "stock_item", "company_name"]
        timestamp = Time.now.strftime('%Y%m%d%H%M%S%L')
        product << [timestamp, details[:product_name], details[:price], details[:stock_item], details[:company_name]]
      end
    end
  end
  
  def remove_product(product_id)
    if File.exist?('shopInventory.csv')
      arr = CSV.read("shopInventory.csv","r")
      CSV.open("shopInventory.csv","w") do |product|
        arr.each do |entry|
      	  unless entry[0].to_i == product_id
      	  	product << entry
       	  end
        end
      end
	  end
  end

  def edit_product(details = {})
    arr = CSV.read("shopInventory.csv","r")
    CSV.open("shopInventory.csv","w") do |product|
      arr.each do |entry|
      	  if entry[0].to_i == details[:product_id]
      	  	entry[1] = details[:product_name]
      	  	entry[2] = details[:price]
      	  	entry[3] = details[:stock_item]
      	  	entry[4] = details[:company_name]
       	  end
       	  product << entry
      end
	end
  end
end