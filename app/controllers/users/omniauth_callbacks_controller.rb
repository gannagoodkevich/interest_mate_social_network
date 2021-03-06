class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if current_user.present?
      current_user.apply_omniauth(request.env['omniauth.auth'])
      redirect_to edit_user_registration_path, notice: 'Facebook Account Linked!'
    else
      @user = User.from_omniauth(request.env['omniauth.auth'])
      sign_in @user, scope: :user
      @user.update!(online: true)
      if @user.name.nil?
        redirect_to new_user_path and return
      else
        redirect_to user_path(id: @user.id) and return
      end
    end
  end
end
