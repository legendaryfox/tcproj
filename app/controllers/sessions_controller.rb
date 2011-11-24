class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    
    if (params[:session][:student] == "1")
      puts "in student login"
      #student login
      user = User.authenticate(params[:session][:email], params[:session][:password])
      if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        render 'new'
        
      elsif (user.confirmed == 0)
        flash.now[:error] = "You are not a confirmed user."
        @title = "Sign in"
        render 'new'
     
      else
        sign_in_user user
        redirect_to user
      end
      
    elsif (params[:session][:student] == "0")
      puts "in cbo login"
      #cbo login
      cbo = Cbo.authenticate(params[:session][:email], params[:session][:password])
      if cbo.nil?
        flash.now[:error] = "Invalid CBO email/password combination."
        @title = "Sign in"
        render 'new'
      elsif (cbo.confirmed == 0)
        flash.now[:error] = "You are not a confirmed CBO."
        @title = "Sign in"
        render 'new'
      else
        sign_in_cbo cbo
        redirect_to cbo
      end
    else
      puts "in nowhere land.."
      puts "params is" + params[:session][:student].class.name
      #do nothing...
    end

  end
  
  def destroy
    sign_out_user
    sign_out_cbo
    redirect_to signin_path
  end

end
