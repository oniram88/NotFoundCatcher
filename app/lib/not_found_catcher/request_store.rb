require 'yaml/store'
class NotFoundCatcher::RequestStore

  attr_accessor :path

  def initialize(path)
    self.path = path
  end


  def parse(request)

    key = get_first_match(request.fullpath)

    store.transaction do

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

    store.transaction(true) do

      store.roots.each do |k|

        if path.match(k)
          return k
        end

      end
    end
    false
  end

  def each

    store.transaction(true) do

      store.roots.each do |k|

        yield store[k]

      end

    end

  end

  def find(key)
    rule = nil
    store.transaction(true) do
      store.roots.each do |k|
        rule = store[k] if store[k].id == key
      end
    end
    rule
  end

  ##
  # Store yaml
  def store
    @_store ||= YAML::Store.new self.path
  end

end