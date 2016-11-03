Rails.application.routes.draw do
  root to: 'home#show'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :challenges
  post '/challenges/:id/add_to_user_list', to: 'user_challenges#create', as: 'new_user_challenge'
  delete '/challenges/:id/remove_from_user_list', to: 'user_challenges#destroy', as: 'delete_user_challenge'
  get '/created_challenges', to: 'challenges#user_created_index', as: 'user_created_challenges'
end
