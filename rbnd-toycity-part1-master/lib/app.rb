require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

products_hash["items"].each do |toy|
    puts toy["title"]
    puts "********************************"
    puts "Retail Price: #{toy["full-price"]}"
    puts "Total Purchases: #{toy["purchases"].length}"

    totalSales = 0.0
    toy["purchases"].each do |sales|
        totalSales = totalSales + sales["price"]
    end
    puts "Totals Sales: #{totalSales}"
    
    averagePrice = totalSales / toy["purchases"].length
    puts "Average Price: #{averagePrice}"

    averageDiscount = ((toy["full-price"].to_f - averagePrice) / toy["full-price"].to_f) * 100 
    puts "Average Discount: #{averageDiscount.round(2)}%"
    puts "********************************"
end




	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined

# initialize hash of arrays
brands_hash = Hash.new(0)
products_hash["items"].each do |toy|
    brands_hash[toy["brand"]] = [0,0,0]
end

# calculate and populate the data
products_hash["items"].each do |toy|
    brands_hash[toy["brand"]][0] += toy["stock"]

    brands_hash[toy["brand"]][1] += toy["full-price"].to_f
    
    toy["purchases"].each do |revenue|
        brands_hash[toy["brand"]][2] += revenue["price"]
    end
end

# print the data
brands_hash.each do |brand, stocks|
    puts brand
    puts "********************************"
    puts "Number of Products in Stock: #{stocks[0]}"
    averagePrice = stocks[1]/stocks[0]
    puts "Average Price: #{averagePrice.round(2)}"
    puts "Total Revenue: #{stocks[2].round(2)}"
    puts ""
end


