class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_wordlist, only: [:index, :create, :edit, :destroy, :update, :rand, :new]
  before_action :set_word, only: [:edit, :update, :destroy]
  before_action :set_authority, only: [:edit]
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

  def set_authority
    if user_signed_in?
      @authority = Authority.where("wordlist_id = #{@wordlist.id}")
      @authority_user = @authority.find { |a| a[:authority_user_code] == current_user.user_code }
    end
  end

  def move_to_index
    unless current_user.id == @wordlist.user.id || !@authority_user.nil? && @authority_user.authority_user_code == current_user.user_code
      redirect_to wordlist_path(@wordlist.id)
    end
  end
end
