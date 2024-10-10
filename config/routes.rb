Rails.application.routes.draw do
  resources :tasks do
    member do
      get :complete
    end
    collection do
      get :completed
    end
  end
  root 'tasks#index'
end