# Utilizza questo file per configurare l'engine
NotFoundCatcher.setup do |config|

  config.dev_mode = false

  config.if_not_considered_path = ->(env){ '/'}

end
