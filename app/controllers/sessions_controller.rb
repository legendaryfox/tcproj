class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    
    if params[:student]
      #student login
      user = User.authenticate(params[:session][:email], params[:session][:password])
      if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        render 'new'
      else
        sign_in_user user
        redirect_to user
      end
      
    else
      #cbo login
      cbo = Cbo.authenticate(params[:session][:email], params[:session][:password])
      if cbo.nil?
        flash.now[:error] = "Invalid CBO email/password combination."
        @title = "Sign in"
        render 'new'
      else
        sign_in_cbo cbo
        redirect_to cbo
      end
      
    end

  end
  
  def destroy
    sign_out_user
    sign_out_cbo
    redirect_to signin_path
  end

end
