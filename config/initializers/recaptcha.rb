# recaptcha config

Recaptcha.configure do |config|
  config.site_key = ENV['RECAPTCHA_ASKMEPROTOTYPE_SITE_KEY']
  config.secret_key = ENV['RECAPTCHA_ASKMEPROTOTYPE_SECRET_KEY']
end
