Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home', to: 'home#home' 
  resources :documents
  get 'documents/pdf/:id', to: 'documents#pdf', as: 'welcome_documents_pdf'
  resources :task
  get 'about', to: 'home#about'
  root 'documents#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
