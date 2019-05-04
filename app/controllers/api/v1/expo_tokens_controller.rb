# frozen_string_literal: true

module Api
  module V1
    class ExpoTokensController < Api::BaseController
      protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
      protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
      
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
