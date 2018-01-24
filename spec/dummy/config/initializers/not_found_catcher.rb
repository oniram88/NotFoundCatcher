# Utilizza questo file per configurare l'engine
NotFoundCatcher.setup do |config|

  config.dev_mode = true

  config.if_not_considered_path = ->(env){ '/'}

end
