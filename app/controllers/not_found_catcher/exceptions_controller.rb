require 'yaml'
module NotFoundCatcher
  class ExceptionsController < NotFoundCatcher.base_catcher_controller.constantize

    def show
      raise NotFoundRouteException.new(request)
    end

  end
end