# frozen_string_literal: true

module Api
  module V1
    class FeelingsController < Api::BaseController
      def create
        @feeling = Feeling.create!(feelings_params)
      end

      def index
        @feelings = Feeling.where(deviceId: params[:deviceId])
        render 'index', formats: [:json], status: 200
      end

      private

      def feelings_params
        params.permit(:deviceId, :mood)
      end
    end
  end
end
