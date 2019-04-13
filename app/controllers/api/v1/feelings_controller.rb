module Api
  module V1
    class FeelingsController < Api::BaseController
      def create
        @feeling = Feeling.create!(feelings_params)
      end

      private

      def feelings_params
        params.permit(:deviceId, :mood)
      end
    end
  end
end
