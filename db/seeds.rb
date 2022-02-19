# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database..."
User.destroy_all
Event.destroy_all
Participation.destroy_all
puts "Database cleared !"

puts "Creating users..."
user_array =[]
admin_number_array = ["1", "2", "3", "4", "5","6", "7", "8", "9", "10"]
admin_option_array = [true, false]
100.times do |i|
   user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        encrypted_password: Faker::Internet.password,
        description: "",
        admin: admin_option_array.sample
        )
        user_array << user
    print "."
end
puts "User successfully created !"



puts "Admin_numbers attributions..."
admin_number = 0
user_array.each do |i|
    if i.admin == true
        admin_number = admin_number + 1
        i.admin_number = admin_number
        i.save
    end
end
puts "Admin_numbers attributed !"



puts "Creating events... "

event_array = ["Party 1","Party 2","Party 3","Party 4","Party 5","Party 6","Party 7","Party 8","Party 9", "Party 10"]
location_array = ["Paris 17", "Paris 10", "Colombes", "Enghien-Les-Bains", "Boulogne"]
5.times do |i|
    event = Event.create(
        title: event_array.sample,
        start_date: Faker::Date.forward(days: 30),
        duration: rand(180..360),
        description: "",
        price: rand(1..1000),
        location: location_array.sample,
        admin_number_id: nil
        )
    print "."
        puts event.title
        puts event.start_date
        puts event.duration
        puts event.description
        puts event.price
        puts event.location
end
puts "Events successfully created !"



puts "Creating participations..."

70.times do |i|
    Participation.create(
        stripe_customer_id: nil
        )
    print "."
end
puts "Participations successfully created !"

