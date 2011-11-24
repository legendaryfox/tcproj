module SessionsHelper
  
  def sign_in_user(user)
    cookies.permanent.signed[:remember_user_token] = [user.id, user.salt]
    current_user = user
  end
  
  def sign_out_user
    cookies.delete(:remember_user_token)
    current_user = nil
  end
    
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in_user?
    !current_user.nil?
  end
  
  def authenticate_user
    deny_access_user unless signed_in_user?
  end
  
  def deny_access_user
    store_location
    redirect_to signin_path, :notice => "Please sign in as a Student to access this page."
  end
  
  
  def sign_in_cbo(cbo)
    cookies.permanent.signed[:remember_cbo_token] = [cbo.id, cbo.salt]
    current_cbo = cbo
  end
  
  def sign_out_cbo
    cookies.delete(:remember_cbo_token)
    current_cbo = nil
  end
  
  def current_cbo=(cbo)
    @current_cbo = cbo
  end
  
  def current_cbo
    @current_cbo ||= cbo_from_remember_token
  end
  
  def current_cbo?(cbo)
    cbo == current_cbo
  end
  
  def signed_in_cbo?
    !current_cbo.nil?
  end
  
  def authenticate_cbo
    deny_access_cbo unless signed_in_cbo?
  end
  
  def deny_access_cbo
    store_location
    redirect_to signin_path, :notice => "Please sign in as a CBO to access this page."
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  
  
  private
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_user_token)
    end
  
    def remember_user_token
      cookies.signed[:remember_user_token] || [nil, nil]
    end
    
    def cbo_from_remember_token
      Cbo.authenticate_with_salt(*remember_cbo_token)
    end
    
    def remember_cbo_token
      cookies.signed[:remember_cbo_token] || [nil, nil]
    end
    
   
    
    def clear_return_to
      session[:return_to] = nil
    end
  
  

end
