class WordlistsController < ApplicationController
  def index
    @wordlists = Wordlist.includes(:user)
  end

  def new
    @wordlist = Wordlist.new
  end

  def create
    @wordlist = Wordlist.new(wordlist_params)
    if @wordlist.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @wordlist = Wordlist.find(params[:id])
  end

  def edit

  end

  def destroy

  end

  private

  def wordlist_params
    params.require(:wordlist).permit(:listname, :text).merge(user_id: current_user.id)
  end
end
