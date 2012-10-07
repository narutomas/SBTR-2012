class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # --- Basic authentication

  def find_authenticated
    return unless request.authorization
    if decoded = ActionController::HttpAuthentication::Basic.decode_credentials(request)
      username, password = decoded.split(':', 2)
      if username == 'admin' && Digest::MD5.hexdigest(password) == ENV['ADMIN_PASSWORD']
        Rails.logger.info("Authenticated user with HTTP Basic Authentication")
        @authenticated = username
      end
    end
  end
  
  def block_access
    find_authenticated
    unless @authenticated
      response.headers['WWW-Authenticate'] = 'Basic realm="Manage"'
      head :unauthorized
    end
  end
end
