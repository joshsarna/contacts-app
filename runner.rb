require 'unirest'

# response = Unirest.delete("localhost:3000/api/contacts/3")

# response = Unirest.post("localhost:3000/api/contacts", parameters: {
#     first_name: "Josh",
#     last_name: "Sarna",
#     email: "joshsarna@gmail.com",
#     phone_number: "123-456-7890"
#   }
# )

response = Unirest.patch("localhost:3000/api/contacts/5", parameters: {phone_number: "098-765-4321"})