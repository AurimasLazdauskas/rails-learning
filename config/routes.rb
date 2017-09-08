Rails.application.routes.draw do

  resources :articles do
      resources :comments
      resources :tags
  end

  post 'articles/add_tag/', to: 'articles#add_tag'

  resources :tags

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
