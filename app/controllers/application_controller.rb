class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  p 'test'
end
