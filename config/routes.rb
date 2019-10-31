Rails.application.routes.draw do
  resources :isbs
  resources :isas
  resources :comments
  resources :images
  get 'request/User'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :arts, :book
  # 
  # 
  # 
  # 
  # 
  resources :client
  resources :doc

  resources :arts do
    collection do
      post 'search'
    end
  	resources :booklists
  end

  resources :about_mes

  root 'arts#new'


  namespace :admin do
    resources :art_person
    resources :art_pen
  end

  namespace :request do
    resources :user
    resources :bank
    resources :bank_branch
    resources :user_bank
    get 'error'
    get 'recharge/index'
    get 'recharge/new'
    post 'recharge/create'
    get 'recharge/contact'
    post 'recharge/contact_create'
  end

  namespace :free do
    # 天气
    get 'weather/index'
    post 'weather/search'
    post 'weather/create'
  end

  # 定义helper
  get 'helperuse/index'

  resources :images

  namespace :v1 do
  	get 'arts/hello'
    get 'weather/index'
  end

  namespace :admin do
    get '/' => 'home#index', as: :root # get '/', :to => 'home#index', as: :root get '/', to: 'home#index', as: :root
  end
end
