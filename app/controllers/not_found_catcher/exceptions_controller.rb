require 'yaml'
module NotFoundCatcher
  class ExceptionsController < NotFoundCatcher.base_catcher_controller.constantize

    def show
      # qua registriamo qualsiasi nuova richiesta
      rs = NotFoundCatcher.request_store

      rs.parse(request) do |req|

        if req.considered?
          redirect_to req.build_redirect(request)
        else
          redirect_to NotFoundCatcher.if_not_considered_path.call(request), status: 302
        end

      end

    end

  end
end