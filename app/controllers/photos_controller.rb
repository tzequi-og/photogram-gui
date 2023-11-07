class PhotosController < ApplicationController
  def photos_list
    @all_photos = Photo.all

    render template: "photo_templates/list"
  end
end
