class TestMailer < ActionMailer::Base
  default :from => "do-not-reply@thecollegeproject.org"
  
  
  def test_mail
      mail(:to => "ysjwang@gmail.com", :subject => "Hello there!")
  end
  
  
end
