Rails.application.routes.draw do
  root to: 'home#show'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :challenges

  get '/created_challenges', to: 'challenges#user_created_index', as: 'user_created_challenges'
  get '/add_test_case', to: 'challenges#add_test_case'

  post '/challenges/:id/add_to_user_list', to: 'user_challenges#create', as: 'new_user_challenge'
  post '/challenges/:id/submit', to: 'user_challenges#submit', as: 'user_challenge_submit'

  delete '/challenges/:id/remove_from_user_list', to: 'user_challenges#destroy', as: 'delete_user_challenge'

  patch 'challenges/:id/update_anki_dates', to: 'user_challenges#update_anki_dates', as: 'user_challenge_update_anki_dates'
end
