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
  
  def signed_in_user?
    !current_user.nil?
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
  
  def signed_in_cbo?
    !current_cbo.nil?
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
  
  

end
