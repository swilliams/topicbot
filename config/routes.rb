Rails.application.routes.draw do

  resources :topics do
    resources :questions, only: [:create, :destroy] do
      post 'vote', to: 'votes#vote', as: 'vote'
      post 'unvote', to: 'votes#unvote', as: 'unvote'
    end
  end

  get '/auth/twitter/callback', to: 'users#auth'

  get '/sign_out', to: 'users#sign_out', as: 'sign_out'

  root "topics#index" 

end
