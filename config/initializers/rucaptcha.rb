RuCaptcha.configure do
  # color style, default: :colorful, allows: [:colorful, :black_white]
  # self.style = :colorful
  # Custom captcha code expire time if you need, default: 2 minutes
  # self.expires_in = 120
  # [Requirement]
  # Store Captcha code where, this config more like Rails config.cache_store
  # default: Read config info from `Rails.application.config.cache_store`
  # But RuCaptcha requirements cache_store not in [:null_store, :memory_store, :file_store]
  # self.cache_store = :mem_cache_store
end