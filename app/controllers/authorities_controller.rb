class AuthoritiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordlist, only: [:index, :create, :edit, :destroy, :update, :new]
  before_action :set_authority, only: [:edit, :destroy, :update]
  before_action :move_to_index, only: [:edit, :destroy]

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

  def edit
  end

  def update
    if @authority.update(authority_params)
      redirect_to wordlist_path(@wordlist.id)
    else
      render :edit
    end
  end

  def destroy
    @authority.destroy
    redirect_to wordlist_path(@wordlist.id)
  end

  private

  def authority_params
    params.require(:authority).permit(:authority_user_code).merge(wordlist_id: params[:wordlist_id])
  end

  def set_wordlist
    @wordlist = Wordlist.find(params[:wordlist_id])
  end

  def set_authority
    @authority = Authority.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @wordlist.user.id
  end
end
