require 'yaml/store'
class NotFoundCatcher::RequestStore

  attr_accessor :path

  def initialize(path)
    self.path = path
  end


  def parse(request)

    store = YAML::Store.new self.path

    store.transaction do
      if store[request.fullpath].nil?
        store[request.fullpath] = NotFoundCatcher::RequestParser.new(request.fullpath, request.request_method, nil)
      end

      yield store[request.fullpath]

    end


  end

end