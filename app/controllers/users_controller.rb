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
  
end
