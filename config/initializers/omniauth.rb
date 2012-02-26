Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '158126120972437', 'f98f022f301918881b19a7937c72e347'
  provider :linked_in, '2qz4ras0s67n', 'PNcnhHpYpeOuwtM0'
end
