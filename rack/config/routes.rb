Rails.application.routes.draw do
  get '/heartbeat', to: proc { [200, {}, [{message: 'Euler is alive'}.to_json]] }
  
  namespace :api do
    namespace :v1 do
      namespace :services do
        resources :urls, only: [:create]
      end
    end
  end
  
  resources :urls, only: [:show], as: :shortened


end