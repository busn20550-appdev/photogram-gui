class UsersController < ActionController::Base

  def index
    @user_list = User.all.order({ :username => :asc })
    render({ :template => "users_templates/index"})
  end

  def show
    url_name = params.fetch("name")
    @username = User.where({ :username => url_name }).at(0)
    render({ :template => "users_templates/show"})
  end

  def add 
    name = params.fetch('input_username')
    new_user = User.new
    new_user.username = name 
    new_user.save 
    redirect_to('/users/' + new_user.username.to_s)
  end 

  def update 
    name = params.fetch('name')
    new_name = params.fetch('input_username')

    matching_user = User.where ({ :username => name })
    updated_user = matching_user.at(0)
    updated_user.username = new_name 
    updated_user.save 
    redirect_to('/users/' + updated_user.username.to_s)
  end 
  
end
