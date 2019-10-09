# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    user = User.from_omniauth(request.env['omniauth.auth'])
    rspotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    hash = rspotify_user.to_hash
    user.rspotify_user_hash = hash
    user.save
    sign_in_and_redirect @user
    byebug
  end
end