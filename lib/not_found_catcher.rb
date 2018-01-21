require "not_found_catcher/engine"
module NotFoundCatcher
  extend ActiveSupport::Autoload

  autoload :RequestStore

  ##
  # Posizione del file yml in cui registrare tutte le richieste andate male
  # e le possibili risoluzioni
  mattr_accessor :request_db
  @@request_db = -> { Rails.root.join('config', 'page_not_found.yml') }


  def self.request_store
    @_req_st ||= (
      path = NotFoundCatcher.request_db.()
      FileUtils.touch path unless File.exists?(path)

      RequestStore.new(path)
    )
  end


end
