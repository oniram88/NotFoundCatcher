module NotFoundCatcher
  class RequestParser < Struct.new(:role, :method, :redirect)


    def considered?
      !redirect.blank?
    end

    ##
    # Return the relative model for this record
    def model

      r = Role.new(
        role: self.role,
        http_method: self.method,
        redirect: self.redirect
      )
      r.request_parser = self
      r

    end


    ##
    # Cerca se stesso all'interno dello store e si salva
    def save
      store = NotFoundCatcher.request_store.store
      store.transaction do

        store[self.role] = self

      end


    end

    def id
      Digest::MD5.hexdigest(self.role)
    end

    def destroy
      store = NotFoundCatcher.request_store.store
      store.transaction do
        store.delete(self.role)
      end
    end


  end
end