class IsasController < ApplicationController
  before_action :set_isa, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /isas
  # GET /isas.json
  def index
    @isas = Isa.all
  end

  # GET /isas/1
  # GET /isas/1.json
  def show
  end

  # GET /isas/new
  def new
    @isa = Isa.new
  end

  # GET /isas/1/edit
  def edit
  end

  # POST /isas
  # POST /isas.json
  def create
    # 
    # isa_params的方法写为：params.require(:isa).permit(:name, :isbname) 则 不能使用new(isa_params[:name]),否则将报分配属性时需使用hash
    # 
    @isa = Isa.new(isa_params)

    # @isa = Isa.create(
    #   :name => isa_params[:name]
    #   )
    if @isa.save 
      @isb = @isa.isbs.create(
      :isbname => isb_params[:isbname])
    end
    respond_to do |format|
      if @isa.save
        format.html { redirect_to @isa, notice: 'Isa was successfully created.' }
        format.json { render :show, status: :created, location: @isa }
      else
        format.html { render :new }
        format.json { render json: @isa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /isas/1
  # PATCH/PUT /isas/1.json
  def update
    respond_to do |format|
      if @isa.update(isa_params) && @isa.isbs.first.update(isb_params)
        format.html { redirect_to @isa, notice: 'Isa was successfully updated.' }
        format.json { render :show, status: :ok, location: @isa }
      else
        format.html { render :edit }
        format.json { render json: @isa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /isas/1
  # DELETE /isas/1.json
  def destroy
    @isa.destroy
    respond_to do |format|
      format.html { redirect_to isas_url, notice: 'Isa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_isa
      @isa = Isa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def isa_params
      params.require(:isa).permit(:name)
    end
    def isb_params
      params.require(:isa).permit(:isbname)
    end
end
