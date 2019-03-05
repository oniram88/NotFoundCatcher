NotFoundCatcher::Engine.routes.draw do

  resources :roles, only: [:index, :edit, :update, :destroy]

  root to: 'roles#index'

end

##
# Appendo una rotta finale per matchare tutto quello sbagliato

Rails.application.routes.append do
  if NotFoundCatcher.enabled
    match '*path', controller: 'not_found_catcher/exceptions', action: :show, via: [:get, :post, :put, :delete]
  end
end