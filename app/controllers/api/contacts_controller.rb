class Api::ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
    render "show.json.jbuilder"
  end

  def index
    if params[:group]
      input_group = params[:group]
      if current_user
        group = Group.find_by(name: params[:group])
        @contacts = group.contacts.where(user_id: current_user['id'])
        render "index.json.jbuilder"
      else
        render json: []
      end
    else
      if current_user
        @contacts = Contact.where(user_id: current_user['id'])
        render "index.json.jbuilder"
      else
        render json: []
      end
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.delete
    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      odor: Faker::Coffee.notes,
      user: current_user,
    )
    @contact.save
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(
      first_name: params[:first_name] || @contact.first_name,
      middle_name: params[:middle_name] || @contact.middle_name,
      last_name: params[:last_name] || @contact.last_name,
      email: params[:email]|| @contact.email,
      phone_number: params[:phone_number] || @contact.phone_number,
      bio: params[:bio]|| @contact.bio
    )
    render "show.json.jbuilder"
  end
end
