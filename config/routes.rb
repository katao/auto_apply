Rails.application.routes.draw do
  resources :homes
  get 'contacts' => 'contacts#spread'
end
