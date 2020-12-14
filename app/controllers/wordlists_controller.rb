class WordlistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_wordlist, only: [:show, :edit, :destroy, :update]


  def index
    @wordlists = Wordlist.page(params[:page]).per(10).order('created_at DESC')
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
    @words = @wordlist.words.includes(:user)
  end

  def edit
    
  end

  def destroy
    
    @wordlist.destroy
    redirect_to root_path
  end

  def update
    if @wordlist.update(wordlist_params)
      redirect_to wordlist_path(@wordlist.id)
    else
      render :edit
    end
  end

  private

  def wordlist_params
    params.require(:wordlist).permit(:listname, :text, :release_id).merge(user_id: current_user.id)
  end

  def set_wordlist
    @wordlist = Wordlist.find(params[:id])
  end
end
