class WordlistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_wordlist, only: [:show, :edit, :destroy, :update]
  before_action :set_authority, only: [:show, :edit]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @wordlists = Wordlist.page(params[:page]).per(10).order('created_at DESC')
  end

  def new
    @wordlist = Wordlist.new
  end

  def create
    @wordlist = Wordlist.new(create_wordlist_params)
    if @wordlist.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @words = @wordlist.words.includes(:user)
    @@word_rand = @wordlist.words.order('RAND()')
  end

  def search
    @model = params['search']['model']
    if params[:keyword] == ""
      redirect_to root_path
    else
      @wordlists = if @model == 'list'
                    Wordlist.search(params[:keyword]).page(params[:page]).per(10).order('created_at DESC')
                  else
                    User.user_search(params[:keyword]).page(params[:page]).per(10).order('created_at DESC')
                  end
      end
  end

  def edit
 
  end

  def destroy
    @wordlist.destroy
    redirect_to root_path
  end

  def update
    if @wordlist.update(update_wordlist_params)
      redirect_to wordlist_path(@wordlist.id)
    else
      render :edit
    end
  end

  private

  def create_wordlist_params
    params.require(:wordlist).permit(:listname, :text, :release_id).merge(user_id: current_user.id)
  end

  def update_wordlist_params
    params.require(:wordlist).permit(:listname, :text, :release_id)
  end

  def set_wordlist
    @wordlist = Wordlist.find(params[:id])
  end

  def set_authority
    if user_signed_in?
      @authority = Authority.where("wordlist_id = #{@wordlist.id}")
      @authority_user = @authority.find{|a| a[:authority_user_code] == current_user.user_code}
    end
  end

  def move_to_index
      redirect_to action: :index unless current_user.id == @wordlist.user.id || @authority_user != nil && @authority_user.authority_user_code == current_user.user_code
  end
end
