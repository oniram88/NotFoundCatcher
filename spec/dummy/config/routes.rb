Rails.application.routes.draw do
  mount NotFoundCatcher::Engine => "/not_found_catcher"

  get 'prova_formato',to:'main#prova_formato', as: :prova_formato

  root 'main#show'

end
