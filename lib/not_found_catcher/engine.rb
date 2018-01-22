module NotFoundCatcher
  class Engine < ::Rails::Engine
    isolate_namespace NotFoundCatcher

     initializer 'not_found_catcher.set_error_catcher', before: "better_errors.configure_rails_initialization" do |app|
       app.config.exceptions_app = ->(env) { NotFoundCatcher::ExceptionsController.action(:show).call(env) }
       app.config.consider_all_requests_local = !NotFoundCatcher.dev_mode if Rails.env.development?
     end

  end
end
