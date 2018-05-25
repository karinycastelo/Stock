class InoutputsController < ApplicationController
  before_action :set_inoutput, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /inoutputs
  # GET /inoutputs.json
  def index
    @inoutputs = Inoutput.all
  end

  # GET /inoutputs/1
  # GET /inoutputs/1.json
  def show
  end

  # GET /inoutputs/new
  def new
    @inoutput = Inoutput.new
    @item = Item.find(params[:item_id])
  end

  # GET /inoutputs/1/edit
  def edit
  end

  # POST /inoutputs
  # POST /inoutputs.json
  def create
    @inoutput = Inoutput.new(inoutput_params)
    @item = @inoutput.item
    @item.sector = @inoutput.sector
    @item.user = @inoutput.user

    respond_to do |format|
      if @inoutput.save && @item.save
        # format.html { redirect_to @inoutput, notice: 'Inoutput was successfully created.' }
        format.html { redirect_to @inoutput.item, notice: 'Inoutput was successfully created.' }
        format.json { render :show, status: :created, location: @inoutput }
      else
        format.html { render :new }
        format.json { render json: @inoutput.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inoutputs/1
  # PATCH/PUT /inoutputs/1.json
  def update
    respond_to do |format|
      if @inoutput.update(inoutput_params)
        format.html { redirect_to @inoutput, notice: 'Inoutput was successfully updated.' }
        format.json { render :show, status: :ok, location: @inoutput }
      else
        format.html { render :edit }
        format.json { render json: @inoutput.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inoutputs/1
  # DELETE /inoutputs/1.json
  def destroy
    @inoutput.destroy
    respond_to do |format|
      format.html { redirect_to inoutputs_url, notice: 'Inoutput was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inoutput
      @inoutput = Inoutput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inoutput_params
      params.require(:inoutput).permit(:name, :quantity, :sector_id, :item_id, :user_id)
    end
end
