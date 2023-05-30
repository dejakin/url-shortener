Rails.application.routes.draw do
  root to: 'links#new'
  post '/links/create', to: 'links#create', as: "create_link"
  get '/:slug', to: 'links#redirect', as: "redirect"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
