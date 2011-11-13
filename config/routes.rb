Rails.application.routes.draw do
  
  namespace :shopify do
    get "login"         => "session#index"
    get "logout"        => "session#logout"
    get "authenticate"  => "session#authenticate"
    get "finalize"      => "session#finalize"
  end
  
end
