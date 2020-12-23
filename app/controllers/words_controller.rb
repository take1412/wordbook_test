class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_wordlist, only: [:index, :create, :edit, :destroy, :update, :rand, :new]
  before_action :set_word, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @words = @wordlist.words.page(params[:page]).per(1)
  end

  def rand
    @words = Kaminari.paginate_array(@@word_rand).page(params[:page]).per(1)
  end

  def new
    @word = Word.new
  end

  def edit

  end

  def update
    if @word.update(update_word_params)
      redirect_to wordlist_path(@wordlist.id)
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to wordlist_path(@wordlist.id)
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

  def update_word_params
    params.require(:word).permit(:wordname, :mean).merge(wordlist_id: params[:wordlist_id])
  end

  def set_wordlist
    @wordlist = Wordlist.find(params[:wordlist_id])
  end

  def set_word
    @word = Word.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @wordlist.user.id
  end
end
