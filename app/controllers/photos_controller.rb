class PhotosController < ActionController::Base

  def index

    @photo = Photo.all.order ({ :created_at => :desc })

    render({ :template => "photos_templates/index"})
  end

  def show
    the_id = params.fetch("id")

    @photo_info = Photo.where({ :id => the_id }).at(0)

    render({ :template => "photos_templates/show"})
  end
  
end
