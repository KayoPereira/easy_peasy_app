Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :wordings
  resources :students do
    resources :payments, only: %i[new create destroy]
    get '/payments', to: "payments#student_index", as: :student_payment_index
  end
end
