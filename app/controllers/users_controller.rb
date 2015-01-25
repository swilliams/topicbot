class UsersController < ApplicationController
  def auth
    twitter_uid = auth_hash.delete("uid")
    @user = User.find_or_create_by(twitter_uid: twitter_uid) do |new_user|
      new_user.twitter_info = auth_hash
    end

    cookies.signed.permanent['u'] = @user.id
    redirect_to root_path
  end

  def sign_out
    cookies.signed['u'] = nil
    redirect_to :back
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
