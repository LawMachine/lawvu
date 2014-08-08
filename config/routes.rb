Rails.application.routes.draw do
  
  

  devise_for :users, :controllers => {:registrations => "registrations", :confirmations => "confirmations", :sessions => "sessions", :passwords=>"passwords", :unlocks=>"unlocks"}, :path => "", :path_names => { :sign_out => 'logout', :edit => 'change_password'}
  devise_scope :user do
    match 'forgot_password' => 'passwords#new', :as=>"forgot_password", :via=>[:get]
    match 'forgot_password' => 'passwords#create', :as=>"forgot_password_done", :via=>[:post]
    match 'reset_password' => 'passwords#edit', :as=>"reset_password", :via=>[:get]
    match 'reset_password' => 'passwords#update', :as=>"reset_password_done", :via=>[:put]
  end
  
  match 'account_settings' => 'profiles#edit', :as=>"account_settings", :via=>[:get]
  match 'account_settings' => 'profiles#update', :as=>"update_account_settings", :via=>[:post,:put,:patch]
  post 'user/upload_profile_pic' => 'profiles#upload_profile_pic', as: 'upload_profile_pic'
  
  
  resources :matters do
    resources :documents do
      member do
        get 'new_version'
        post 'upload_version'
        get 'previous_versions'
        delete 'delete_version'
        get 'download'
      end
    end
    member do
      get 'accept'
      get 'summary'
    end
  end
  resources :profiles do
    member do
      get 'change_image'
    end
    collection do
      get 'search_lawyers'
      get 'search_clients'
    end
  end
  root to: "homes#index"
end
