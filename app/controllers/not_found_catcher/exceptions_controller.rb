require 'yaml'
module NotFoundCatcher
  class ExceptionsController < ApplicationController

    def show
      # qua registriamo qualsiasi nuova richiesta
      rs = NotFoundCatcher.request_store

      rs.parse(request) do |req|
        redirect_to req.redirect
      end

    end

  end
end