Rails.application.routes.draw do
  resources :items do
    collection { post :import }
  end  
  root 'static_pages#landing'
  get 'static_pages/import'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
