class Api::V1::TradingSystemsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :authenticate_user!
  before_action :set_trading_system, only: %i[ show update destroy ]

  # GET /trading_systems
  def index
    p current_user
    @trading_systems = TradingSystem.all

    render json: @trading_systems
  end

  # GET /trading_systems/1
  def show
    render json: @trading_system
  end

  # POST /trading_systems
  def create
    @trading_system = TradingSystem.new(trading_system_params)

    if @trading_system.save
      render json: @trading_system, status: :created, location: @trading_system
    else
      render json: @trading_system.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trading_systems/1
  def update
    if @trading_system.update(trading_system_params)
      render json: @trading_system
    else
      render json: @trading_system.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trading_systems/1
  def destroy
    @trading_system.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trading_system
      @trading_system = TradingSystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trading_system_params
      params.require(:trading_system).permit(:name, 
                                             :description, 
                                             :expectancy, 
                                             :reliability,
                                             :opportunity_month,
                                             :cost_per_trade,
                                             :id
                                            )
    end
end
