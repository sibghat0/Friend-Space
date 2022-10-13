Rails.application.routes.draw do
  get 'home', to: 'home#home' 
  resources :documents
  get 'documents/pdf/:id', to: 'documents#pdf', as: 'welcome_documents_pdf'
  resources :taskers
  get 'taskers', to: 'taskers#click', as: 'taskers_click'
  get 'about', to: 'home#about'
  root 'home#home'
end
