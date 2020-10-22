Rails.application.routes.draw do
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :users, only: [:new, :create,:show]
end
