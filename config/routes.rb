NotFoundCatcher::Engine.routes.draw do
end

##
# Appendo una rotta finale per matchare tutto quello sbagliato
Rails.application.routes.append do
  match '*path', controller: 'not_found_catcher/exceptions', action: :show, via: [:get, :post, :put, :delete]
end