class PhotosController < ApplicationController
  def photos_list
    @all_photos = Photo.all

    render template: "photo_templates/list"
  end

  def create
    post = Photo.new
    post.image = params.fetch("new_post")
    post.caption = params.fetch("new_caption")
    post.owner_id = params.fetch("new_owner")
    post.save

    @all_photos = Photo.all

    redirect_to("/photos/#{post.id}")
  end
end
