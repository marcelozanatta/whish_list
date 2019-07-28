Rails.application.routes.draw do
  resources :product_personal_whish_lists
  resources :personal_whish_lists, path: ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
