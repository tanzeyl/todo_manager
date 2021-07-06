class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    response_text = "Hey, a new user has been created with ID: #{new_user.id}."
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where(email: email, password: password)
    render plain: user.present?
  end

end
