Podcasts::Application.routes.draw do
  root to: 'episodes#index', show_id: 'giantrobots'

  constraints show_id: /giantrobots|buildphase/ do
    get '/:show_id' => 'episodes#index', as: :show_episodes
    get '/:show_id/:id' => 'episodes#show', as: :show_episode
  end
end
