class QresponsesController < ApplicationController
  
  before_filter :authenticate_user, :only => [:new, :create]
=begin  
  def new
    @title = "New Questionnaire Response"
    @questionnaire = :params[:id]
    @qresponse = current_user.qresponses.new(:questionnaire_id => @questionnaire.id)
  end
=end

  def create
    @questionnaire = Questionnaire.find(params[:qresponse][:questionnaire_id])

    @qresponse = current_user.qresponses.new(
      :questionnaire_id => @questionnaire.id,
      
      :question1_text => @questionnaire.question1_text,
      :question2_text => @questionnaire.question2_text,
      :question3_text => @questionnaire.question3_text,
      :question4_text => @questionnaire.question4_text,
      :question5_text => @questionnaire.question5_text,
      :question6_text => @questionnaire.question6_text,
      :question7_text => @questionnaire.question7_text,
      :question8_text => @questionnaire.question8_text,
      :question9_text => @questionnaire.question9_text,
      :question10_text => @questionnaire.question10_text,
      
      :question1_response => params[:qresponse][:question1_response],
      :question2_response => params[:qresponse][:question2_response],
      :question3_response => params[:qresponse][:question3_response],
      :question4_response => params[:qresponse][:question4_response],
      :question5_response => params[:qresponse][:question5_response],
      :question6_response => params[:qresponse][:question6_response],
      :question7_response => params[:qresponse][:question7_response],
      :question8_response => params[:qresponse][:question8_response],
      :question9_response => params[:qresponse][:question9_response],
      :question10_response => params[:qresponse][:question10_response])
    

=begin
    @qresponse = current_user.qresponses.new(
      params[:qresponse],
      :question1_text => @questionnaire.question1_text,
      :question2_text => @questionnaire.question2_text,
      :question3_text => @questionnaire.question3_text,
      :question4_text => @questionnaire.question4_text,
      :question5_text => @questionnaire.question5_text,
      :question6_text => @questionnaire.question6_text,
      :question7_text => @questionnaire.question7_text,
      :question8_text => @questionnaire.question8_text,
      :question9_text => @questionnaire.question9_text,
      :question10_text => @questionnaire.question10_text
    
    )
=end
    # do some validation?
    
    if @qresponse.save
      redirect_to @questionnaire.cbo.cboprofile, :notice => "Thank you for your application!"
    else
      @title = "New Questionnaire Response"
      @qresponse = current_user.qresponse.new(params[:qresponse])
      render 'questionnaires/reply'
    end
    
    
    
  end

  def show
    @qresponse = Qresponse.find_by_id(params[:id])
    @title = "Viewing Questionnaire Response"
  end

  def index
    @qresponses = Qresponse.all
    @title = "Questionnaire Responses"
  end

end
