NotFoundCatcher::Engine.routes.draw do
end

Rails.application.routes.append do
  match '*path', controller: 'not_found_catcher/exceptions', action: :show, via: [:get, :post, :put, :delete]
end