Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_stocks', to: 'stocks#search'
  
end
