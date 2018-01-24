module NotFoundCatcher
  class Role < ActiveType::Object

    attr_accessor :request_parser

    attribute :role, :string
    attribute :http_method, :string
    attribute :redirect, :string


    def persisted?
      true
    end

    def id
      self.role
    end

    def save

      request_parser.role = self.role
      request_parser.method = self.http_method
      request_parser.redirect = self.redirect

      request_parser.save

    end

  end
end