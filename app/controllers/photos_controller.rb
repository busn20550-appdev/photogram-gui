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
  
  def del 
    the_id = params.fetch('id')
    matching_photo = Photo.where ({ :id => the_id })
    the_photo = matching_photo.at(0)
    the_photo.destroy 
    redirect_to('/photos')
  end 

  def input 
    
    image = params.fetch('input_image')
    caption = params.fetch('input_caption')
    owner_id = params.fetch('input_owner_id')

    new_photo = Photo.new

    new_photo.image = image 
    new_photo.caption = caption
    new_photo.owner_id = owner_id 
    
    new_photo.save 

    redirect_to('/photos/' + new_photo.id.to_s)
  end 

  def update 
    the_id = params.fetch('id')
    image = params.fetch('input_image')
    caption = params.fetch('input_caption')

    matching_photo = Photo.where ({ :id => the_id})
    updated_photo = matching_photo.at(0)
    updated_photo.image = image
    updated_photo.caption = caption
    updated_photo.save

    redirect_to('/photos/' + updated_photo.id.to_s)
  end 

  def comment 
    photo_id = params.fetch('input_photo_id')
    author_id = params.fetch('input_author_id')
    input_body = params.fetch('input_body') 

    new_comment = Comment.new

    new_comment.photo_id = photo_id 
    new_comment.author_id = author_id
    new_comment.input_body = input_body 
    
    new_comment.save 

    redirect_to('/photos/' + new_comment.photo_id.to_s )
  end 

end
