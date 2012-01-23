class QuestionnairesController < ApplicationController
  
  before_filter :authenticate_cbo, :only => [:new, :create]
  
  def new
    @title = "New Questionnaire"
    @questionnaire = Questionnaire.new
  end
  
  def edit
    @questionnaire = Questionnaire.find(params[:id])
    @title = "Edit Questionnaire"

  end

  def update
    @questionnaire = Questionnaire.find(params[:id])
    if @questionnaire.update_attributes(params[:questionnaire])
      redirect_to @questionnaire, :flash => { :success => "Questionnaire updated." }
    else
      @title = "Edit Questionnaire"
      render 'edit'
    end
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
