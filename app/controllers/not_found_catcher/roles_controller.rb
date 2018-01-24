module NotFoundCatcher
  class RolesController < ApplicationController

    def index
      @store = NotFoundCatcher.request_store
    end

    def edit
      @obj = NotFoundCatcher.request_store.find(params[:id]).model
    end

    def update
      @obj = NotFoundCatcher.request_store.find(params[:id]).model
      @obj.assign_attributes(params.require(:role).permit(:role, :method, :redirect))


      respond_to do |f|

        if @obj.valid?

          @obj.save
          f.html { redirect_to root_path }
        else
          render :edit
        end

      end

    end

  end
end