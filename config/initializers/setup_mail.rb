ActionMailer::Base.smtp_settings = {
  :address => "smtp.bit.lt",
  :port => '25',
  :domain => "mydomain.com",
  :authentication => :plain,
  :user_name => "tomas@ebox.lt",
  :password => "tomopastas"
}
