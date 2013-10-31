Podcasts::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root to: 'shows#index'

  constraints show_id: /giantrobots|buildphase/ do
    get '/:show_id' => 'episodes#index', as: :show_episodes
    get '/:show_id/:id' => 'episodes#show', as: :show_episode
  end

  resources :shows, only: [:index]
end
