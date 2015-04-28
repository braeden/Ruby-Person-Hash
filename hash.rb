require 'faker'
#sudo gem install faker
f = File.new("names.txt","r")
names = f.readlines
f.close

system "clear" or system "cls"

puts "Systhesizing Information..."
puts "Please Wait"
names = names.collect do |name|
	name.chomp.downcase.capitalize
end
details = {}
symbols = [".", "_", "", ".."]
names.each do |x|
	first = Faker::Name.first_name
	details[x] = ["\n" + "Full Name: " + first + " " + x + "\n" + "Email: " + Faker::Internet.free_email(first + symbols.sample + x + rand(100).to_s) + "\n" + "Address: " + Faker::Address.street_address + "\n" + "City: " + Faker::Address.city + "\n" + "Zip Code: " + Faker::Address.zip + "\n" + "State: " + Faker::Address.state + "\n" + "Phone Number: " + Faker::PhoneNumber.cell_phone + "\n" + "Mac Address: " + Faker::Internet.mac_address + "\n" + "IPV4: " + Faker::Internet.ip_v4_address + "\n" + "IPV6: " + Faker::Internet.ip_v6_address + "\n"]
end

#puts details.inspect
system "clear" or system "cls"
begin
	loop {
		puts "Lookup by last name OR enter 'quit' to exit OR 'random' OR 'clear':  "
		name = gets.chomp.capitalize
		if name=="Random"
			random = names.sample
			puts ""
			puts random
			puts details[random]
			puts ""
		elsif name=="Quit"
			exit
		elsif name=="Clear"
			system "clear" or system "cls"
		else
			puts details[name]
			puts ""
		end
	}
end
