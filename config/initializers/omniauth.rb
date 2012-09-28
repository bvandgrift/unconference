Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, Settings.auth.twitter.key, Settings.auth.twitter.secret
end 
