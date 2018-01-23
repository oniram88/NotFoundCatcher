require 'yaml/store'
class NotFoundCatcher::RequestStore

  attr_accessor :path

  def initialize(path)
    self.path = path
  end


  def parse(request)


    store.transaction do

      key = get_first_match(request.fullpath)

      if key
        req = store[key]
      else
        req = store[request.fullpath] = NotFoundCatcher::RequestParser.new(request.fullpath, request.request_method, nil)
      end

      yield req

    end


  end

  ##
  # Restituisce la prima chiave matchata
  def get_first_match(path)
    store.transaction do

      store.roots.each do |k|

        Rails.logger.debug k.inspect
        if path.match(k)
          return k
        end

      end
    end
    false
  end

  ##
  # Store yaml
  def store
    #TODO cache?
    YAML::Store.new self.path
  end

end