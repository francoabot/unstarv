OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["1427074967594599"], ENV["14591fbffa0f7b25606f0e6102635ac2"]
end