class IsbsController < ApplicationController
  before_action :set_isb, only: [:show, :edit, :update, :destroy]

  # GET /isbs
  # GET /isbs.json
  def index
    @isbs = Isb.all
  end

  # GET /isbs/1
  # GET /isbs/1.json
  def show
  end

  # GET /isbs/new
  def new
    @isb = Isb.new
  end

  # GET /isbs/1/edit
  def edit
  end

  # POST /isbs
  # POST /isbs.json
  def create
    @isb = Isb.new(isb_params)

    respond_to do |format|
      if @isb.save
        format.html { redirect_to @isb, notice: 'Isb was successfully created.' }
        format.json { render :show, status: :created, location: @isb }
      else
        format.html { render :new }
        format.json { render json: @isb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /isbs/1
  # PATCH/PUT /isbs/1.json
  def update
    respond_to do |format|
      if @isb.update(isb_params)
        format.html { redirect_to @isb, notice: 'Isb was successfully updated.' }
        format.json { render :show, status: :ok, location: @isb }
      else
        format.html { render :edit }
        format.json { render json: @isb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /isbs/1
  # DELETE /isbs/1.json
  def destroy
    @isb.destroy
    respond_to do |format|
      format.html { redirect_to isbs_url, notice: 'Isb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_isb
      @isb = Isb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def isb_params
      params.require(:isb).permit(:name, :isa_id_id)
    end
end
