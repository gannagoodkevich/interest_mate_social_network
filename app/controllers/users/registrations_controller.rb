# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # after_action :set_online_status, only: [:create]

  def create
    super
  end
end
