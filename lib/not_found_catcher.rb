require "not_found_catcher/engine"
module NotFoundCatcher
  extend ActiveSupport::Autoload

  autoload :RequestStore
  autoload :RequestParser

  ##
  # Posizione del file yml in cui registrare tutte le richieste andate male
  # e le possibili risoluzioni
  mattr_accessor :request_db
  @@request_db = -> {Rails.root.join('config', 'page_not_found.yml')}


  def self.request_store
    @_req_st ||= (
    path = NotFoundCatcher.request_db.()
    FileUtils.touch path unless File.exists?(path)

    RequestStore.new(path)
    )
  end


  mattr_accessor :dev_mode
  @@dev_mode = false

  mattr_accessor :if_not_considered_path
  @@if_not_considered = ->(env){ Rails.application.routes.url_helpers.root_path }


  # Default way to setup TikalCore. Run "rails generate tikal_core_install" to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end


end
