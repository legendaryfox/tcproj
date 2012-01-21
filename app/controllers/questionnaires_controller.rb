class QuestionnairesController < ApplicationController
  
  before_filter :authenticate_cbo, :only => [:new, :create]
  
  def new
    @title = "New Questionnaire"
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = current_cbo.build_questionnaire(params[:questionnaire])
    if @questionnaire.save
      redirect_to @questionnaire
    else
      @title = "New Questionnaire"
      render 'new'
    end
  end
    
    
  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

end
