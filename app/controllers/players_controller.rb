class PlayersController < ApplicationController
  before_action :set_player,          only: [:show, :edit, :update, :destroy]
  before_action :correct_user,        only: [:edit, :upadate, :destory]
  before_action :authenticate_user!,  except: [:index, :show]
  

  respond_to :html

  def index
    @players = Player.all
    respond_with(@players)
  end

  def show
    respond_with(@player)
  end

  def new
    @player = current_user.players.build
    respond_with(@player)
  end

  def edit
  end

  def create
    @player = current_user.players.build(player_params)
    @player.save
    respond_with(@player)
  end

  def update
    @player.update(player_params)
    respond_with(@player)
  
  end

  def destroy
    @player.destroy
    respond_with(@player)
  end




  private
    def set_player
      @player = Player.find(params[:id])
    end
    
    def correct_user
      @player = current_user.players.find_by(id: params[:id])
      redirect_to players_path, notice: "Not authorized to edit this Player" if @player.nil?
    end

    def player_params
      params.require(:player).permit(:name, :college)
    end
end
