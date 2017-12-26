class QuantityTypesController < ApplicationController
  before_action :set_quantity_type, only: [:show, :edit, :update, :destroy]

  # GET /quantity_types
  # GET /quantity_types.json
  def index
    @quantity_types = QuantityType.all
  end

  # GET /quantity_types/1
  # GET /quantity_types/1.json
  def show
  end

  # GET /quantity_types/new
  def new
    @quantity_type = QuantityType.new
  end

  # GET /quantity_types/1/edit
  def edit
  end

  # POST /quantity_types
  # POST /quantity_types.json
  def create
    @quantity_type = QuantityType.new(quantity_type_params)

    respond_to do |format|
      if @quantity_type.save
        format.html { redirect_to @quantity_type, notice: 'Quantity type was successfully created.' }
        format.json { render :show, status: :created, location: @quantity_type }
      else
        format.html { render :new }
        format.json { render json: @quantity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quantity_types/1
  # PATCH/PUT /quantity_types/1.json
  def update
    respond_to do |format|
      if @quantity_type.update(quantity_type_params)
        format.html { redirect_to @quantity_type, notice: 'Quantity type was successfully updated.' }
        format.json { render :show, status: :ok, location: @quantity_type }
      else
        format.html { render :edit }
        format.json { render json: @quantity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quantity_types/1
  # DELETE /quantity_types/1.json
  def destroy
    @quantity_type.destroy
    respond_to do |format|
      format.html { redirect_to quantity_types_url, notice: 'Quantity type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quantity_type
      @quantity_type = QuantityType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quantity_type_params
      params.require(:quantity_type).permit(:name, :quantity)
    end
end
