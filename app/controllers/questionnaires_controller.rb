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
    @cboprofile = Cboprofile.find(params[:id])
    if @cboprofile.update_attributes(params[:cboprofile])
      redirect_to @cboprofile, :flash => { :success => "Profile updated." }
    else
      @title = "Edit User Profile"
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
