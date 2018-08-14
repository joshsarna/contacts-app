json.first_name contact.first_name
json.middle_name contact.middle_name
json.last_name contact.last_name
json.email contact.email
json.phone_number contact.phone_number
json.bio contact.bio

json.formatted do
  json.updated_at contact.month_day_year
  json.full_name contact.full_name
  json.japanese_phone contact.japanese_phone
end

json.user contact.user
json.odor contact.odor
json.groups contact.groups