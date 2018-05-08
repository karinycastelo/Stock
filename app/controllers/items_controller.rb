class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    params[:search] ? @items = Item.search(params[:search].downcase) : @items = Item.all
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

    if params[:rent] == "on"
      @item.rent = true
      @item.enterprise_id = Enterprise.where(name: params[:item][:enterprise_id]).first.id
    else
      @item.rent = false
    end

    @item.type_id = Type.where(description: params[:item][:type_id]).first.id
    @item.sector_id = Sector.where(name: params[:item][:sector_id]).first.id
    @item.user_id = User.where(name: params[:item][:user_id]).first.id
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item foi criado com sucesso.' }
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
        format.html { redirect_to @item, notice: 'Item foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item foi excluído com sucesso.' }
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
      params.require(:item).permit(:code, :name, :description, :patrimony, :type_id, :sector_id, :quantity, :user_id, :rent, :enterprise_id)
    end
end