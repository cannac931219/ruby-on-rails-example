class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    p '----'
    p @images
    p '*****'
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    # @image = Image.all.first
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    if image_params[:avatar].blank? != true
      @image = Image.new(image_params)

      respond_to do |format|
        if @image.save
          format.html { redirect_to @image, notice: 'Image was successfully created.' }
          format.json { render :show, status: :created, location: @image }
        else
          format.html { render :new }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @image = Image.all.first
        format.html { redirect_to @image, notice: 'error: upload again.' }
        format.json { render :show }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    # 数据 + 图片删除
    @image.destroy
    
    # 图片字段的value清空
    # @image.avatar = nil
    # @image.save!

    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :avatar)
    end
end
