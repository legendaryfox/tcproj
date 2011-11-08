class CbosController < ApplicationController
  def new
  end
  
  def show
    @cbo = Cbo.find(params[:id])
  end

end
