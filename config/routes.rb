Railsbridge::Application.routes.draw do
  get "/team", to: 'pages#team'
  get "/sponsors", to: 'pages#sponsors'
  get "/contact", to: 'pages#contact'
  root 'pages#home'
end
