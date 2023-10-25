Rails.application.routes.draw do
  devise_for :users
  root to: "students#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :wordings
  resources :students do
    resources :payments, only: %i[new create destroy]
    get '/payments', to: "payments#student_index", as: :student_payment_index
  end
end
