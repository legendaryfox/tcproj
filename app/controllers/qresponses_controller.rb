class QresponsesController < ApplicationController

=begin  
  before_filter :authenticate_user, :only => [:new, :create]


  def create
    @questionnaire = Questionnaire.find(params[:qresponse][:questionnaire_id])
    @cbo = @questionnaire.cbo
    
    if current_user.qresponses.find_by_questionnaire_id(@questionnaire.id)
      # a response already exists! error out.
      redirect_to @questionnaire.cbo.cboprofile, :flash => { :error => "You have already filled out an application." }
    
    elsif !(Membership.all(:conditions => "cbo_id = " + @cbo.id.to_s + " AND user_id = " + current_user.id.to_s).count == 0)
        #current_user.join_cbo!(@cbo)
        #redirect_to @cbo.cboprofile, :flash => { :success => "You have applied to this CBO." } 
      # a membership between this questionnaire's CBO and this user already exists! error out.
      redirect_to @questionnaire.cbo.cboprofile, :flash => { :error => "You are already part of this CBO!"}
      
    
    
    else
      
      
      
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
    
    
      
    
      if @qresponse.save
        # this first save DOES NOT HAVE membership!
        
        # now we can create the membership
        new_membership = current_user.join_cbo!(@cbo)
        @qresponse.membership_id = new_membership.id # ENSURE THAT ATTR_ACCESSIBLE IS SET.
        
        if @qresponse.save
          # resave with membership ID.
          redirect_to @questionnaire.cbo.cboprofile, :notice => "Thank you for your application!"
        else
          # something happened....
        end
      
      
      else
        @title = "New Questionnaire Response"
        @qresponse = current_user.qresponse.new(params[:qresponse])
        render 'questionnaires/reply'
      end
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
  
  def my
    if signed_in_user?
      @qresponses = current_user.qresponses
    elsif signed_in_cbo?
      @qresponses = []
      current_cbo.questionnaire.qresponses.each do |qresponse|
        if qresponse.membership.confirmed != 0 
          @qresponses.push(qresponse)
        end
      end

    else
      authenticate_user
    end
      
    
  end
=end
end
