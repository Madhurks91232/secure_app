class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  # skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception
end
