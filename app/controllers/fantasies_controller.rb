class FantasiesController < ApplicationController
  before_action :authorize, only: %i[ create update destroy ]
  before_action :set_fantasy, only: %i[ show update destroy ]
 
  # GET /fantasies
  def index
    @fantasies = Fantasy.all

    render json: @fantasies
  end

  # GET /fantasies/1
  def show
    render json: @fantasy
  end

  # POST /fantasies
  def create
    @fantasy = Fantasy.new(fantasy_params)

    if @fantasy.save
      render json: @fantasy, status: :created, location: @fantasy
    else
      render json: @fantasy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fantasies/1
  def update
    if @fantasy.update(fantasy_params)
      render json: @fantasy
    else
      render json: @fantasy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fantasies/1
  def destroy
    @fantasy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fantasy
      @fantasy = Fantasy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fantasy_params
      params.require(:fantasy).permit(:character, :location, :poem, :race)
    end
end
