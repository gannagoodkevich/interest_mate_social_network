# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def not_existed_error
    render(file: "#{Rails.root}/public/404.html", layout: false)
  end

  def share_activity(content)
    ActionCable.server.broadcast 'room_channel',
                                 content: content
  end

  private

  def after_sign_in_path_for(_resource)
    new_user_path && return if request.referer == new_user_registration_url || request.referer == users_url
    main_page_path
  end
end
