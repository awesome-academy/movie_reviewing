OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '583107032081517', '1534343a72d0ae710e0717fdf8829f9e'
end
