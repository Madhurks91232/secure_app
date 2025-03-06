Rails.application.config.session_store :cookie_store, 
  key: '_secure_app_session', 
  expire_after: 2.minutes
