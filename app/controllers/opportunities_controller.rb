class OpportunitiesController < ApplicationController
  def show
    @opportunity = Opportunity.find(params[:id])
  end
  
  def new
    @title = "New Opportunity"
    @opportunity = Opportunity.new
  end
  
  def create
    @opportunity = Opportunity.new(params[:opportunity])
    if @opportunity.save
      redirect_to @opportunity
    else
      @title = "New Opportunity"
      render 'new'
    end
  end

end
