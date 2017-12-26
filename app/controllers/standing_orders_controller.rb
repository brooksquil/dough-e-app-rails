class StandingOrdersController < ApplicationController
  before_action :set_standing_order, only: [:show, :edit, :update, :destroy]

  # GET /standing_orders
  # GET /standing_orders.json
  def index
    @standing_orders = StandingOrder.all
  end

  # GET /standing_orders/1
  # GET /standing_orders/1.json
  def show
  end

  # GET /standing_orders/new
  def new
    @standing_order = StandingOrder.new
  end

  # GET /standing_orders/1/edit
  def edit
  end

  # POST /standing_orders
  # POST /standing_orders.json
  def create
    @standing_order = StandingOrder.new(standing_order_params)

    respond_to do |format|
      if @standing_order.save
        format.html { redirect_to @standing_order, notice: 'Standing order was successfully created.' }
        format.json { render :show, status: :created, location: @standing_order }
      else
        format.html { render :new }
        format.json { render json: @standing_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standing_orders/1
  # PATCH/PUT /standing_orders/1.json
  def update
    respond_to do |format|
      if @standing_order.update(standing_order_params)
        format.html { redirect_to @standing_order, notice: 'Standing order was successfully updated.' }
        format.json { render :show, status: :ok, location: @standing_order }
      else
        format.html { render :edit }
        format.json { render json: @standing_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standing_orders/1
  # DELETE /standing_orders/1.json
  def destroy
    @standing_order.destroy
    respond_to do |format|
      format.html { redirect_to standing_orders_url, notice: 'Standing order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standing_order
      @standing_order = StandingOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standing_order_params
      params.require(:standing_order).permit(:week_day, :quantity, :is_active)
    end
end
