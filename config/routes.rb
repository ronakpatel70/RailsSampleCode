Rails.application.routes.draw do
  get 'welcome/index'

  post 'get_data' => 'welcome#get_data'

root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
