class PhotosController < ActionController::Base
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end
  
  def show

    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template =>"photo_templates/show.html.erb"})
  end

  def baii
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/baii.html.erb"})

    redirect_to("/photos")
  end



end