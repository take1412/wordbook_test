class AuthoritiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordlist, only: [:index, :create, :edit, :destroy, :update, :new]
  def new
    @authority = Authority.new
  end

  def create
    @authority = Authority.new(authority_params)
    if @authority.save
      redirect_to wordlist_path(@authority.wordlist.id)
    else
      render :new
    end
  end

  def destroy
    
  end


  private
  def authority_params
    params.require(:authority).permit(:authority_user_code).merge(wordlist_id: params[:wordlist_id])
  end


  def set_wordlist
    @wordlist = Wordlist.find(params[:wordlist_id])
  end
end
