# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :set_online_status, only: [:create]
  before_action :remove_online_status, only: [:destroy]

  def create
    super
  end

  def destroy
    super
  end

  def set_online_status
    @user = current_user
    @user.update!(online: true)
    ActionCable.server.broadcast 'room_channel',
                                 content: "#{@user.nickname} is online"
  end

  def remove_online_status
    @user = current_user
    @user.update!(online: false)
    ActionCable.server.broadcast 'room_channel',
                                 content: "#{@user.nickname} is offline"
  end
end
