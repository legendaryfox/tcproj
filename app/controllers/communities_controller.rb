class CommunitiesController < ApplicationController
  def new
    @title = "New Community"
    @community = Community.new
  end

  def show
    @community = Community.find(params[:id])
  end

  def index
    @communities = Community.all
    @title = "All Communities"
  end

end
