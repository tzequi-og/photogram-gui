class UsersController < ApplicationController
  
  def users_list
    @all_users = User.all

    render template: "user_templates/list"
  end

  def create
    handle = params.fetch("new_username")
    user = User.new
    user.username = handle
    user.private = false
    user.likes_count = 0
    user.comments_count = 0
    user.save

    @all_users = User.all

    redirect_to("/users/#{user.username}")
  end

  def detail
    handle = params.fetch("username")
    @user = User.where({ :username => handle }).first
    @photos = @user.own_photos

    render template: "user_templates/detail"
  end
    
  def update
    handle = params.fetch("username")
    new_handle = params.fetch("new_username")
    user = User.where({ :username => handle }).first
    user.username = new_handle
    user.save

    @all_users = User.all

    redirect_to("/users/#{user.username}")
  end
end
