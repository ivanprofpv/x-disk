Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }, path_names: { sign_in: :login, sign_out: :logout }
  resource :profile, only: %i[ edit update show ] do
    resources :userfiles, shallow: true, only: %i[ new create destroy]
  end


  root to: "profiles#show"
end
