Railsbridge::Application.routes.draw do

  get "/team", to: 'pages#team'
  get "/sponsors", to: 'pages#sponsors'
  get "/contact", to: 'pages#contact'
  post "/mailer", to: 'messages#create', as: :mailer

  root 'pages#home'
end
