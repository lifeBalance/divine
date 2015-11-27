Rails.application.routes.draw do
  root 'static_pages#home'

  get 'heaven', :to => 'static_pages#heaven'

  devise_for :users
end
