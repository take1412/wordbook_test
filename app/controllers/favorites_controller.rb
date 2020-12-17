class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordlist, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id).page(params[:page]).per(10).order('created_at DESC')
  end

  def create
    favorite = @wordlist.favorite.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    favorite = @wordlist.favorite.find_by(user_id: current_user.id)
    if favorite.present?
      favorite.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def set_wordlist
    @wordlist = Wordlist.find(params[:wordlist_id])
  end
end
