Rails.application.routes.draw do
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  post    'cercaservizi' =>'ricerches#servizivicini'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'servizis/:id/Aggpref'  => 'favorites#create', as: 'aggiungi'
  get    '/preferiti'          => 'users#listapreferiti', as: 'preferiti'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :servizis,          only: [:create, :destroy, :show]
  resources :recensionis,       only: [:create, :destroy]
  resources :domandes,          only: [:create, :destroy, :edit, :update]
  resources :ricerches,          only: [:create, :destroy]
  resource :session, only: [:create, :destroy]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
