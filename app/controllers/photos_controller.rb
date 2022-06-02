class PhotosController < ApplicationController
  
  def save
     
    @customization_first_name = params.fetch("query_first_name_id")
    @customization_last_name = params.fetch("query_last_name_id")
    @customization_tagline = params.fetch("tagline")
    @customization_image = params.fetch("customization_image")
    @customization_phone = params.fetch("query_phone")

    @the_photo = Photo.where({:phone => @customization_phone}).at(0)

    # Contact.where({ :last_name => "Mouse" })
    # new_submission = Photo.new
    # new_submission.tagline = @customization_tagline
    # new_submission.first_name = @customization_first_name
    # new_submission.last_name = @customization_last_name
    # new_submission.image = @customization_image

    # new_submission.save

    render({ :template => "photos/saved.html.erb" })

  end

  def display
    # Parameters: {"query_name_id"=>"Dallin", "tagline"=>"Tagline example", "customization_image"=>#<ActionDispatch::Http::UploadedFile:0x000055ee8f4d8978 @tempfile=#<Tempfile:/tmp/RackMultipart20220601-5210-1iyt5y7.png>, @original_filename="Screen Shot 2022-05-16 at 9.03.34 AM.png", @content_type="image/png", @headers="Content-Disposition: form-data; name=\"customization_image\"; filename=\"Screen Shot 2022-05-16 at 9.03.34 AM.png\"\r\nContent-Type: image/png\r\n">}
    
    @customization_first_name = params.fetch("query_first_name_id")
    @customization_last_name = params.fetch("query_last_name_id")
    @customization_tagline = params.fetch("tagline")
    @customization_phone = params.fetch("query_phone")
    @customization_image = params.fetch("customization_image")

    @new_photo = Photo.new
    @new_photo.image = @customization_image
    @new_photo.first_name = @customization_first_name
    @new_photo.last_name = @customization_last_name
    @new_photo.tagline = @customization_tagline
    @new_photo.phone = @customization_phone

    if @new_photo.valid?
      if @new_photo.first_name.to_s.length.to_i + @new_photo.last_name.to_s.length.to_i + @new_photo.tagline.to_s.length.to_i < 90

          @new_photo.save
          matching_photos = Photo.all
          @list_of_photos = matching_photos.order({ :created_at => :desc })

          render({ :template => "photos/display.html.erb" })

        else redirect_to("/", { :alert => "Your first name, last name, and services tagline combined must be less than 90 characters. Please make them shorter." })
      end
      
    else   redirect_to("/", { :alert => @new_photo.errors.full_messages.to_sentence })
    
  end

    

  end

  
  def input

    render({ :template => "photos/input.html.erb" })

  end

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id })
    @the_photo = matching_photos.at(0)

    all_videos = Content.all
    @list_of_videos = all_videos.order({ :name => :desc })

    render({ :template => "photos/show.html.erb" })
  end

  def create
    the_photo = Photo.new
    the_photo.image = params.fetch("query_image")
    the_photo.tagline = params.fetch("query_tagline")
    the_photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.image = params.fetch("query_image")
    the_photo.tagline = params.fetch("query_tagline")
    # the_photo.id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos/#{the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{the_photo.id}", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
