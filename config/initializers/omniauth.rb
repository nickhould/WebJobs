Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CQSTNa8slwiUE9nJtMwg', '9RNqVdZax780au8akfVsccUXeKb4UhvyjKy9kSKA'
  provider :linkedin, 'dixwqgghzun5', 'B6OlufMXR1f500jU'
end