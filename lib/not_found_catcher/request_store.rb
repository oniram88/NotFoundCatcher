require 'yaml/store'
class NotFoundCatcher::RequestStore

  attr_accessor :path

  Request = Struct.new :full_path, :method, :redirect

  def initialize(path)
    self.path = path
  end


  def parse(request)

    store = YAML::Store.new self.path

    store.transaction do
      if store[request.fullpath].nil?
        store[request.fullpath] = Request.new(request.fullpath, request.request_method, nil)
      else
        req = store[request.fullpath]

        unless req.redirect.blank?
          yield req
        end

      end
    end


  end

end