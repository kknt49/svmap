Rails.application.routes.draw do
  
  resources :pictures do
    collection do
      post :confirm
    end
  end
  
  resources :categories, only: [:new, :create, :show, :destroy]

  get 'tops/index'
  root to: "tops#index"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end