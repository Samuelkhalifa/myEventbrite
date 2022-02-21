=begin
puts "Clearing database..."
    User.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!('users') #ID down to 1

    Event.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!('events') #ID down to 1

    Participation.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!('participations') #ID down to 1

    Admin.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!('admins') #ID down to 1
puts "Database cleared !"



puts "Creating users..."
admin_option_array = [true, false]
100.times do |i|
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        encrypted_password: Faker::Internet.password,
        description: "",
        admin: admin_option_array.sample
        )
    print "."
end
puts "Users successfully created !"



puts "Creating admins..."
users = User.all
users.each do |i|
    x = i.admin
    Admin.create(
        user_id: i.id,
        first_name: i.first_name,
        last_name: i.last_name,
        email: i.email
        )
        admin = Admin.last
    if x == false
        admin.destroy
    print "."
    end
end
puts "Users successfully created !"
puts "Admins successfully created !"



puts "Creating events... "
event_array = ["Party 1","Party 2","Party 3","Party 4","Party 5","Party 6","Party 7","Party 8","Party 9", "Party 10"]
3.times do |i|
    event = Event.create(
        title: event_array.sample,
        start_date: "Wed, 25 Sep 2014", #Faker::Date.forward(days: 30),
        duration: rand(180..360),
        description: "...",
        price: rand(1..1000),
        location: Faker::Address.city,
        admin_id: Admin.all.sample.id
        )
    print "."
    puts event.title
    puts event.start_date
    puts event.duration
    puts event.description
    puts event.price
    puts event.location
    puts event.admin_id
end
puts "Events successfully created !"

=end


puts "Creating participations..."
1.times do |i|
    Participation.create(
        user_id: User.all.sample.id,
        event_id: Event.all.sample.id,
        stripe_customer_id: nil
        )
    print "."
end
puts "Participations successfully created !"

