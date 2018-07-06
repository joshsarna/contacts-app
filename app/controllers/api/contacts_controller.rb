class Api::ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
    render "show.json.jbuilder"
  end

  def index
    @contacts = Contact.all
    render "index.json.jbuilder"
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.delete
    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    @contact.save
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(
      first_name: params[:first_name] || @contact.first_name,
      last_name: params[:last_name] || @contact.last_name,
      email: params[:email]|| @contact.email,
      phone_number: params[:phone_number] || @contact.phone_number
    )
    render "show.json.jbuilder"
  end
end
