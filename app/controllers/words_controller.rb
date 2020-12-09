class WordsController < ApplicationController

  def new
    @wordlist = Wordlist.find(params[:wordlist_id])
    @word = Word.new
  end

  def show
    
  end

  def create
    @wordlist = Wordlist.find(params[:wordlist_id])
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

end
