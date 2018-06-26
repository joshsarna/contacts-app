json.array! @contacts.each do |contact|
  json.contact_entry contact
end