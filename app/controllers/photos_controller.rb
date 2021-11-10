class PhotosController < ActionController::Base

  def index
    render({ :template => "photos_templates/index"})
  end

  def show
    the_id = params.fetch("id")

    render({ :template => "photos_templates/show"})
  end
  
end
