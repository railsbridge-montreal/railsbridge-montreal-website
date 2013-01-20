RailsbridgeMontreal::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount Henry::Engine => '/api'
  mount Georgia::Engine => '/admin'

  resources :pages, only: [] do
    post '/preview', to: 'pages#preview', as: :preview, on: :member
  end

  get '/:slug(/:slug)(/:slug)', to: 'pages#show', as: :page

  resources :messages, only: [:create]

  root to: 'pages#show', slug: 'home'


end
