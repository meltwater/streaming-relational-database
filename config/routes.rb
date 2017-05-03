Rails.application.routes.draw do
  resources :documents, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints format: :json do
    resources :webhooks, only: :create
  end
end
