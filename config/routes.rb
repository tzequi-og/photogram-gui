Rails.application.routes.draw do

  get "/", controller: "users", action: "users_list"

  get "/users", controller: "users", action: "users_list"
  get "/users/:username", controller: "users", action: "detail"
  post "/add_user", controller: "users", action: "create"
  post "/update_user/:username", controller: "users", action: "update"

  get "/photos", controller: "photos", action: "photos_list"
end
