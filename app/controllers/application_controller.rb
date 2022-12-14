# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_user_session, :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)

    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = current_user_session&.user
  end

  def check_user_session
    return if current_user_session

    redirect_to new_user_session_path
  end
end
