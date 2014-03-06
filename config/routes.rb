Railsbridge::Application.routes.draw do

  resources :registrants

  get '/register', to: 'registrants#new'
  post "/mailer"  , to: 'messages#create' , as: :mailer

  localized do
    get "/team"     , to: 'pages#team'
    get "/sponsors" , to: 'pages#sponsors'

    root 'pages#home'
  end

end
