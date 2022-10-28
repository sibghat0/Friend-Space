Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  get 'questions', to: 'questions#check'
  get 'home', to: 'home#home' 
  resources :documents
  get 'documents/pdf/:id', to: 'documents#pdf', as: 'welcome_documents_pdf'
  get '/passcode/:id', to: 'documents#passcode', as: 'passcode'
  resources :taskers
  get 'taskers', to: 'taskers#click', as: 'taskers_click'
  get 'about', to: 'home#about'
  get 'Profile', to: 'home#profile', as: 'profile'
  root 'home#home'
end
