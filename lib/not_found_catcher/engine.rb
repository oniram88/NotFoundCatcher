module NotFoundCatcher
  class Engine < ::Rails::Engine
    isolate_namespace NotFoundCatcher

    # initializer 'not_found_catcher.set_error_catcher', before: "better_errors.configure_rails_initialization" do |app|
    #   app.config.exceptions_app = ->(env) { ExceptionHandler::ExceptionsController.action(:show).call(env) }
    # end

  end
end
