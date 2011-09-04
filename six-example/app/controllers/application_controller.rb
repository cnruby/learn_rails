class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :abilities, :can?

  protected 

  def abilities
    @abilities ||= Six.new
  end

  # simple delegate method for controller & view
  def can?(subject, action, object)
    abilities.allowed?(subject, action, object)
    # abilities.allowed?(action, object, subject)
  end
end
