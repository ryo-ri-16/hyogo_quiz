Rails.application.routes.draw do
  root "questions#index"

  resources :questions, only: [ :index ] do
    collection do
      post :start
      get  :play
      post :answer
      get  :result
    end
  end
end
