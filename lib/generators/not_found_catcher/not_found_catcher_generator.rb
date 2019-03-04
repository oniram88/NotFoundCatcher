class NotFoundCatcherGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer
    copy_file 'not_found_catcher.rb.erb', 'config/initializers/not_found_catcher.rb'
  end

end
