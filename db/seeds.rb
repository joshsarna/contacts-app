# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# contact = Contact.new(first_name: "Scooby", last_name: "Dooby-Doo", email: "mysterydog@shaggysserver.com", phone_number: "23452345")
# contact.save

contacts = Contact.all
groups = Group.all

contacts.each do |contact|
  first_group = groups.shuffle.pop
  second_group = groups.shuffle.pop
  ContactGroup.create(contact_id: contact.id, group_id: first_group.id)
  ContactGroup.create(contact_id: contact.id, group_id: second_group.id)
end

# even_numbers = [0..29].map{|x| x.even?}
# relationships = 


# users = User.all

# contacts.each do |contact|
#   contact.user_id = users.sample.id
#   contact.save
# end