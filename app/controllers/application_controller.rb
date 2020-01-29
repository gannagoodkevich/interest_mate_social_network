class ApplicationController < ActionController::Base
  def not_existed_error
    render(file: "#{Rails.root}/public/404.html", layout: false)
  end
end
