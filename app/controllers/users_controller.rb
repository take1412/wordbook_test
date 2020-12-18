class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @wordlists = @user.wordlists.page(params[:page]).per(10).order('created_at DESC')
  end
end
