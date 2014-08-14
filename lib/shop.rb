require "csv"
module Shop

  # Another module to define only class methods and no instance methods
  module Classmethods
    def list_product
      if File.exist?('shopInventory.csv')
        products = CSV.foreach("shopInventory.csv",headers:true) do |item|
          print item
        end
      else
        print "No records found\n"
      end
    end
    def search_product(product_name)
      if product_name == nil
        abort("Arguement missing: Usage search_product product_name")
      end
      if File.exist?('shopInventory.csv')
        products = CSV.foreach("shopInventory.csv",headers:true) do |product|
          if product["product_name"].to_s.upcase.include? product_name.upcase
            print product
          end
        end
      else
        print "No records found\n"
      end
    end
  end
  
  def self.included(base)
    base.extend(Classmethods)
  end

end