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

  def update
    post_id = params.fetch("post_id")
    post = Photo.where({ :id => post_id }).first
    post.image = params.fetch("new_img")
    post.caption = params.fetch("new_caption")
    post.save

    redirect_to("/photos/#{post.id}")
  end

  def delete
    post_id = params.fetch("post_id")
    post = Photo.where({ :id => post_id }).first
    post.destroy

    redirect_to("/photos")
  end

  def detail
    post_id = params.fetch("post_id")
    @post = Photo.where({ :id => post_id }).first
    @comments = @post.comments

    render template: "photo_templates/detail"
  end

  def comment
    comment = Comment.new
    comment.photo_id = params.fetch("post_id")
    comment.body = params.fetch("new_comment")
    comment.author_id = params.fetch("author_id")
    comment.save

    redirect_to("/photos/#{comment.photo_id}")
  end

end
