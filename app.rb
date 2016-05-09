require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts

puts "******************************************"
require 'date'
puts "Today's date: " + DateTime.now.strftime('%m/%d/%Y')
puts "******************************************"

puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
puts
puts "******************************************"

# For each product in the data set:
products_hash["items"].each do |toy|
  # Print the name of the toy
	puts "Toy name: #{toy["title"]}"
  # Print the retail price of the toy
	puts "Retail price: $#{toy["full-price"]}"
	# Calculate and print the total number of purchases
	puts "Total purchases: #{toy["purchases"].size}"
  # Calculate and print the total amount of sales
	@total_sales = toy['purchases'].inject(0) do |sum, el|
    sum + el["price"]
  end
		puts "Total amount of sales: $" + @total_sales.to_s
  # Calculate and print the average price the toy sold for
	average_price = @total_sales / toy['purchases'].size
		puts "Average sales price: $" + average_price.to_s
  # Calculate and print the average discount (% or $) based off the average sales price
	average_discount = toy["full-price"].to_f.round(2) - average_price.to_f.round(2)
		puts "Average discount: $" + average_discount.to_s

	average_disc_perc = ((toy["full-price"].to_f - average_price) / toy["full-price"].to_f * 100).round(0)
		puts "Equals a discount of: " + average_disc_perc.to_s + " %"
	end

	puts
	puts "******************************************"

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

	puts "******************************************"
	puts
	# For each brand in the data set:
	products_hash["items"].each do |toy, brand|
		# Print the name of the brand
		puts "Toy name: #{toy["title"]}"
  	puts "Brand: #{toy["brand"]}"
		 # Count and print the number of the brand's toys we stock
		puts "On stock: #{toy["stock"]}".to_s
		# Calculate and print the average price of the brand's toys
		unique_brands = products_hash["items"].map {|item| item["brand"]}.uniq
		unique = unique_brands.each_with_index do | brand, index |
		puts "On iteration #{index} we will be calculating data for #{brand}"
		brands_toys = products_hash["items"].select { | item | item["brand"] == brand }
# do calculations and print output using brands_toys
end
  # Calculate and print the total revenue of all the brand's toy sales combined
	total_revenue = @total_sales
		puts "Total revenue of all brands combined: " + total_revenue.to_s
end
end
