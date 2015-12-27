Rails.application.routes.draw do
  # homepage

  get "/" => "posts#index"

  # login and writers routes

  get "/login" => "writers#login_form"
  post "/login" => "writers#login"
  delete "/logout" => "writers#logout"

  get "/register" => "writers#new"
  post "/register" => "writers#create"

  get "/writers/:id" => "writers#show"
  get "/writers/:id/edit" => "writers#edit"
  patch "/writers/:id" => "writers#update"
  put "/writers/:id" => "writers#update"
  delete "/writers/:id" => "writers#destroy"

  # posts routes

  get "/posts/new" => "posts#new"
  post "/posts" => "posts#create"
  get "/posts/:id" => "posts#show"
  post "/posts/:id/publish" => "posts#publish"
  get "/posts/:id/edit" => "posts#edit"
  patch "/posts/:id" => "posts#update"
  put "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"

  # posts by type

  get "/posts/economics_posts" => "posts#economics_posts"
  get "/posts/environment_posts" => "posts#environment_posts"
  get "/posts/politics_posts" => "posts#politics_posts"
  get "/posts/social_values_posts" => "posts#social_values_posts"
  get "/posts/education_posts" => "posts#education_posts"
  get "/posts/religion_posts" => "posts#religion_posts"
  get "/posts/health_posts" => "posts#health_posts"
  get "/posts/foreign_policy_posts" => "posts#foreign_policy_posts"
  get "/posts/military_posts" => "posts#military_posts"
  get "/posts/science_technology_posts" => "posts#science_technology_posts"

  # responses routes

  get "/posts/:id/responses/new" => "responses#new"
  post "/posts/:id/responses" => "responses#create"
  get "/posts/:id/responses/:id/edit" => "responses#edit"
  patch "/posts/:id/responses/:id" => "responses#update"
  put "/posts/:id/responses/:id" => "responses#update"
  delete "/posts/:id/responses/:id" => "responses#destroy"

  get "/writers/:id/posts/:id/responses" => "responses#index"
  post "/writers/:id/posts/:id/responses/:id" => "responses#approve"

end
