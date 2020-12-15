class WordsController < ApplicationController
  before_action :set_wordlist, only: [:index, :create, :edit, :destroy, :update, :rand, :new]
  before_action :move_to_index, only: [:edit, :destroy]


  def index
    @words = @wordlist.words.page(params[:page]).per(1)
    
  end
  
  def rand

    @words = @wordrand.page(params[:page]).per(1)
  end

  def new
    @word = Word.new
  end

  def show
    
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to wordlist_path(@word.wordlist.id)
    else
      render :new
    end
  end

  private

  def word_params
    params.require(:word).permit(:wordname, :mean).merge(user_id: current_user.id, wordlist_id: params[:wordlist_id])
  end

  def set_wordlist
    @wordlist = Wordlist.find(params[:wordlist_id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @wordlist.user.id
  end

end
