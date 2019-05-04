# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    skip_before_action :verify_authenticity_token
  end
end
