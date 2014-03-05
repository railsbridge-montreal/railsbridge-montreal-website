Railsbridge::Application.routes.draw do

  post "/mailer"  , to: 'messages#create' , as: :mailer

  localized do
    get "/team"     , to: 'pages#team'
    get "/sponsors" , to: 'pages#sponsors'

    root 'pages#home'
  end

end
