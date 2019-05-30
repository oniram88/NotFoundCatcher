module NotFoundCatcher
  class NotFoundRouteException < StandardError

    attr_accessor :request

    def initialize(request)
      @request = request
      super("Not Found Routes #{request.fullpath}")
    end

  end
end