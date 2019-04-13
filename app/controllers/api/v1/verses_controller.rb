module Api
  module V1
    class VersesController < Api::BaseController
      def index
        @verses = Verse.where(need: params[:need], theme: params[:theme])
        render 'index', formats: [:json], status: 200
      end
    end
  end
end
