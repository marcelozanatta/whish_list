Rails.application.routes.draw do
  resources :product_personal_whish_lists do
    collection do
      get 'product_search/:name' => 'product_personal_whish_lists#product_search', as: :product_search
    end
  end
  resources :personal_whish_lists, path: ''

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
