json.array! @contacts.each do |contact|
  json.contact_entry contact

  json.formatted do
    json.updated_at contact.month_day_year
    json.full_name contact.full_name
    json.japanese_phone contact.japanese_phone
  end
end