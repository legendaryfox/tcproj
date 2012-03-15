class QuestionnairesController < ApplicationController
=begin  
  before_filter :authenticate_cbo, :only => [:new, :create]
  before_filter :authenticate_user, :only => [:reply]
  
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
  
  def reply
    @questionnaire = Questionnaire.find(params[:id])
    
    if current_user.qresponses.find_by_questionnaire_id(params[:id])
      # they have already answered this
      redirect_to @questionnaire.cbo.cboprofile, :flash => { :error => "You have already filled out an application." }
    else
      
      @title = "New Questionnaire Response"
      @qresponse = current_user.qresponses.new(:questionnaire_id => @questionnaire.id)
    end
    
  end
    
    
  def show
    @questionnaire = Questionnaire.find(params[:id])
  end
  
  
=end 
end
