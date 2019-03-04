module NotFoundCatcher
  class Middleware

    def initialize(app)
      @app = app
    end

    def exceptions_to_catch
      @_exceptions_to_catch ||= NotFoundCatcher.exceptions_to_catch.collect {|v| v.is_a?(String) ? v.constantize : v}
    end

    def redirect_to(location, content_type: 'text/html', status: 301)
      [status, {'Location' => location, 'Content-Type' => content_type}, ['Moved Permanently']]
    end

    def call(env)
      begin
        ris = @app.call(env)
      rescue *exceptions_to_catch

        begin
          rs = NotFoundCatcher.request_store
          request = ActionDispatch::Request.new(env)

          rs.parse(request) do |req|

            if req.considered?
              redirect_path = req.build_redirect(request)
              Rails.logger.info {"[NOT_FOUND_CATCHER] Catch #{request.fullpath} -> #{redirect_path}"}
              ris = redirect_to redirect_path
            else
              Rails.logger.info {"[NOT_FOUND_CATCHER] Catch non gestito:#{request.fullpath}"}
              ris = redirect_to NotFoundCatcher.if_not_considered_path.call(request), status: 302
            end

          end
        rescue Exception => e
          Rails.logger.info {"[NOT_FOUND_CATCHER] Problemi - #{e.message}"}
        end

      end
      ris
    end

  end
end