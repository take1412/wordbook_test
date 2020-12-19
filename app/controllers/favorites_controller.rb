class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordlist, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id).page(params[:page]).per(10).order('created_at DESC')
  end

  def create
    favorite = Favorite.new(user_id: current_user.id, wordlist_id: params[:wordlist_id])
    favorite.save
    

    # render json:{ wordlist: @wordlist }

    # respond_to do |format|
    #   format.js {render :template => "wordlists/show",locals: { favorite: @favorite, wordlist: @wordlist} } 
    #   end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, wordlist_id: params[:wordlist_id])
    favorite.destroy

  end

  private

  def set_wordlist
    @wordlist = Wordlist.find(params[:wordlist_id])
  end
end
