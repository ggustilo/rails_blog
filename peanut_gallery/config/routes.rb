Rails.application.routes.draw do
# get "/posts/:id" => "posts#show"

  get "/" => "posts#index"

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

  get "/posts/new" => "posts#new"
  post "/posts" => "posts#create"
  get "/posts/:id" => "posts#show"
  post "/posts/:id/publish" => "posts#publish"
  get "/posts/:id/edit" => "posts#edit"
  patch "/posts/:id" => "posts#update"
  put "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"

  get "/posts/:id/responses/new" => "responses#new"
  post "/posts/:id/responses" => "responses#create"
  get "/posts/:id/responses/:id/edit" => "responses#edit"
  patch "/posts/:id/responses/:id" => "responses#update"
  put "/posts/:id/responses/:id" => "responses#update"
  delete "/posts/:id/responses/:id" => "responses#destroy"

  get "/writers/:id/posts/:id/responses" => "responses#index"
  post "/writers/:id/posts/:id/responses/:id" => "responses#approve"
  # TODO - add ability to include only three approved responses with original post

end

# articles GET    /articles(.:format)          articles#index
#              POST   /articles(.:format)          articles#create
#  new_article GET    /articles/new(.:format)      articles#new
# edit_article GET    /articles/:id/edit(.:format) articles#edit
#      article GET    /articles/:id(.:format)      articles#show
#              PATCH  /articles/:id(.:format)      articles#update
#              PUT    /articles/:id(.:format)      articles#update
#              DELETE /articles/:id(.:format)      articles#destroy
#         root GET    /                            welcome#index
