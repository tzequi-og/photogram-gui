Rails.application.routes.draw do

  get "/", controller: "users", action: "users_list"

  get "/users/:username", controller: "users", action: "detail"
  post "/add_user", controller: "users", action: "create"
end
