# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def not_existed_error
    render(file: "#{Rails.root}/public/404.html", layout: false)
  end

  def active_path?(test_path)
    return 'active' if request.path == test_path

    ''
  end

  private

  def after_sign_in_path_for(resource)
    ref = request.referer
    new_user_path if request.referer == 'http://localhost:3000/users/sign_up'
  end
end
