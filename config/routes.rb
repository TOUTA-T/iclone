Rails.application.routes.draw do
  root'users#new'
  resources :posts do
    collection do
      post:confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :sessions, only: [:new, :create, :destroy,]
  # お気に入りルーティング追加
  resources :users do
    get :favorites, on: :collection
  end
  resources :favorites, only:[:create, :destroy,]
end
