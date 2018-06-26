Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get '/first_contact_url' => "api/contacts#first_contact_action"
  get '/all_contacts_url' => "api/contacts#all_contacts_action"
end
