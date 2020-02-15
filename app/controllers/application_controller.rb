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

  def after_sign_in_path_for(_resource)
    new_user_path if request.referer == 'https://floating-ridge-36832.herokuapp.com/users/sign_up'
  end
end
