Rails.application.routes.draw do
  mount NotFoundCatcher::Engine => "/not_found_catcher"
end
