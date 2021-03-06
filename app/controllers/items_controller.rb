class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    Rails.logger.debug("index.params=#{params}")
    
    #Find rate for szip and dzip supplied
    @cost1 = Rate.where(szip: params[:szip], dzip: params[:dzip]).first.onelbs if params[:szip].present?
    
    #Find item by the skuid supplied
    @items = Item.by_skuid(params[:skuid])
    
    #Calculate Shipping cost 
    @shippingcost = (@cost1 * @items.first.weight) if params[:szip].present?
    
    #Determine profitability of Item based on shipping cost
    @items.each { |x| x.profitable = @shippingcost < x.price ? "Yes" : "No"  if params[:szip].present?}
    
    #Suggest multiple for loss making items
    @items.each { |x| x.multiple = @shippingcost > x.price ? (@shippingcost/x.price).ceil : "Null"  if params[:szip].present?}
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #Import from CSV feature
  def import
    Item.import(params[:file])
    redirect_to items_path, notice: "Products imported."
  end
  
  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:skuid, :description, :price, :length, :width, :height, :weight, :multiple, :profitable)
    end
end