module NotFoundCatcher
  class ApplicationController < NotFoundCatcher.base_admin_controller.constantize
    protect_from_forgery with: :exception
  end
end
