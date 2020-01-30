class ApplicationController < ActionController::Base
  def not_existed_error
    render(file: "#{Rails.root}/public/404.html", layout: false)
  end

  def active_path?(test_path)
    return 'active' if request.path == test_path

    ''
  end
end
