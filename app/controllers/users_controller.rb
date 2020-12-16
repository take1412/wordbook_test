class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:id])
    if current_user.id == user.id
      @nickname = user.nickname
      @wordlists = user.wordlists.page(params[:page]).per(10).order('created_at DESC')
    else
      redirect_to root_path
    end
  end
end
