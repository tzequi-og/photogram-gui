Rails.application.routes.draw do

  get "/", controller: "users", action: "users_list"

  get "/users", controller: "users", action: "users_list"
  get "/users/:username", controller: "users", action: "detail"
  post "/add_user", controller: "users", action: "create"
  post "/update_user/:username", controller: "users", action: "update"

  get "/photos", controller: "photos", action: "photos_list"
  get "/photos/:post_id", controller: "photos", action: "detail"
  post "/add_photo", controller: "photos", action: "create"
  get "delete_photo/:post_id", controller: "photos", action: "delete"
  post "update_photo/:post_id", controller: "photos", action: "update"
  post "/add_comment", controller: "photos", action: "comment"
end
