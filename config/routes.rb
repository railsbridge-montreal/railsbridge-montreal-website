Rails.application.routes.draw do
  resource :admin, only: :show

  resources :checks do
    get :script, on: :collection
  end

  get 'register/edit', to: 'registrants#edit'
  resources :registrants do
    post :validate_email, on: :collection
    patch :update, on: :collection
    delete :cancel, on: :collection, as: :cancel
    get '/course/:course_id', to: 'registrants#course', on: :collection, as: :course
  end

  post "/mailer"  , to: 'messages#create' , as: :mailer

  # More information on localized routes here: https://github.com/enriclluelles/route_translator
  # Actual paths in locale files, i.e. config/locales/(en|fr).yml
  localized do
    get "/team",     to: 'pages#team'
    get '/register', to: 'registrants#new'
    get "/sponsors", to: 'pages#sponsors'
    get "/conduct",  to: 'pages#code_of_conduct', as: :conduct
    get "/thanks",   to: 'pages#donations_thanks'
    get "/thanks",   to: 'pages#contact'
    root to: 'pages#home'
  end
end
