class GamesController < ApplicationController
	before_action :set_game, only: [:show, :edit, :update, :destroy]
	def index
		@games = policy_scope(Game)
	end

	def show
	end

	def new
		@game = Game.new
		authorize @game
	end

	def create
		@game = Game.new(game_params)
		authorize @game
		@game.user = current_user
		if @game.save
			redirect_to game_path(@game)
		else
			render 'new'
		end
	end
	def edit
	end

	def update
		@game.update(game_params)
		redirect_to game_path(@game)
	end

	def set_game
		@game = Game.find(params[:id])
		authorize @game
	end

	def destroy
		Game.destroy(params[:id])
    	redirect_to games_path
	end

	private

	def game_params
		params.require(:game).permit(:name, :description, :photo)
	end
end
