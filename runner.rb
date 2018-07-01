require 'unirest'

# response = Unirest.delete("localhost:3000/api/contacts/3")

# response = Unirest.post("localhost:3000/api/contacts")

# response = Unirest.patch("localhost:3000/api/contacts/5", parameters: {phone_number: "098-765-4321"})

p "What is the first name of your new contact?"
input_first_name = gets.chomp
p "What is the last name of your new contact?"
input_last_name = gets.chomp
p "What is the email of your new contact?"
input_email = gets.chomp
p "What is the phone number of your new contact?"
input_phone_number = gets.chomp

response = Unirest.post("localhost:3000/api/contacts", parameters: {
    first_name: input_first_name,
    last_name: input_last_name,
    email: input_email,
    phone_number: input_phone_number
  }
)