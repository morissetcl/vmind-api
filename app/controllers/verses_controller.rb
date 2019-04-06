class VersesController < ApplicationController
  def index
    @verses = Verse.all
    json_response(@verses)
  end
end
