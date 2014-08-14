#!/usr/bin/env ruby

$LOAD_PATH << "."
require "shop"
require "csv"

class User
  include Shop
  def buy(details = {})
    if File.exist?('shopInventory.csv')
      arr = CSV.read("shopInventory.csv","r")
      CSV.open("shopInventory.csv","w") do |product|
        arr.each do |entry|
          if entry[0].to_i == details[:product_id]
            if entry[3].to_i == 0
              print "Cannot Buy. Product out of stock.\n"
            else
              entry[3] = entry[3].to_i - 1
              print "Congratulations. Product bought.\n"
            end
          end
          product << entry
        end
      end
    else
      print "No records found.\n"
    end
    
    if File.exist?('orders.csv')
      CSV.open("orders.csv","a+") do |product|
        product << [details[:product_id], details[:user_name], details[:credit_card], details[:cvv]]
      end
    else
      CSV.open("orders.csv","a+") do |product|
        product << ["product_id", "user_name", "credit_card", "cvv"]
        product << [details[:product_id], details[:user_name], details[:credit_card], details[:cvv]]
      end
    end
  end
end