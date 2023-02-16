class ApplicationController < ActionController::Base
   protect_from_forgery unless: -> { request.format.json? }
   add_flash_types :success, :warning, :danger, :info
end
