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
  get "/writers/:id/public" => "writers#public_show"
  get "/writers/:id/edit" => "writers#edit"
  patch "/writers/:id" => "writers#update"
  put "/writers/:id" => "writers#update"
  delete "/writers/:id" => "writers#destroy"

  # posts by type

  get "/posts/active_posts" => "posts#active_posts"
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

  # posts routes

  get "/posts/new" => "posts#new"
  post "/posts" => "posts#create"
  get "/posts/:id" => "posts#show", as: "posts_show"
  post "/posts/:id/publish" => "posts#publish", as: "posts_published"
  get "/posts/:id/edit" => "posts#edit"
  patch "/posts/:id" => "posts#update"
  put "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
  post "/posts/:id/upvote" => "posts#upvote", as: "posts_upvote"
  post "/posts/:id/downvote" => "posts#downvote", as: "posts_downvote"
  post "/posts/:id/flag" => "posts#flag", as: "posts_flag"

  # responses routes

  get "/posts/:post_id/responses/new" => "responses#new"
  post "/responses" => "responses#create"
  get "/responses/:id" => "responses#show", as: "responses_show"
  get "/responses/:id/edit" => "responses#edit"
  patch "/responses/:id" => "responses#update"
  put "/responses/:id" => "responses#update"
  delete "/responses/:id" => "responses#destroy"

  get "/responses" => "responses#index"
  post "/responses/:id" => "responses#approve", as: "responses_approve"
  post "/responses/:id/upvote" => "responses#upvote", as: "responses_upvote"
  post "/responses/:id/downvote" => "responses#downvote", as: "responses_downvote"
  post "/responses/:id/flag" => "responses#flag", as: "responses_flag"

end
