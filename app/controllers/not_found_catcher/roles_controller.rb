module NotFoundCatcher
  class RolesController < NotFoundCatcher::ApplicationController

    before_action :load_object, only: [:edit, :update, :destroy]

    def index
      @store = NotFoundCatcher.request_store
    end

    def edit
    end

    def update
      @obj.assign_attributes(params.require(:role).permit(:role, :method, :redirect))


      respond_to do |f|

        if @obj.valid?

          @obj.save
          f.html {redirect_to root_path}
        else
          render :edit
        end

      end

    end

    def destroy
      respond_to do |f|

        if @obj.destroy
          f.html {redirect_to root_path}
        else
          render :edit
        end

      end
    end

    private
    def load_object
      @obj = NotFoundCatcher.request_store.find(params[:id]).model
    end

  end
end