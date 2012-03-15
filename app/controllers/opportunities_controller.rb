class OpportunitiesController < ApplicationController
  
=begin
  def show
    @opportunity = Opportunity.find(params[:id])
  end
  
  def new
    @title = "New Opportunity"
    @opportunity = Opportunity.new
    #params[:opportunity][:cbo] = 'hello' #current_cbo
  end
  
  def create
    @opportunity = current_cbo.opportunities.build(params[:opportunity])
    if @opportunity.save
      redirect_to @opportunity
    else
      @title = "New Opportunity"
      render 'new'
    end
  end
=end
end
