# frozen_string_literal: true

module Api
  module V1
    class ExpoTokensController < Api::BaseController
      skip_before_action :verify_authenticity_token

      def create
        @expo_token = ExpoToken.create!(expo_token_params)
      end

      private

      def expo_token_params
        params.require(:expo_token).permit(:token)
      end
    end
  end
end
