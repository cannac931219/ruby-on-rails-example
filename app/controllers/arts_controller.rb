class ArtsController < ApplicationController
  # http_basic_authenticate_with name: "xxn", password: "111", except: [:index, :show]

  # layout 'admin', only: [:new]

  def new 
    @art = Art.new
  end
  
  # 一般将edit放在new 和 create 之间。
  def edit
    @art = Art.find(params[:id])
  end

  def create
    raise 'raise 开发' if !USE_SWITCH
  	# render plain: 'submit success' render plain: params[:arts]
  	# 使用的是类 模型，所以大写Art 这里的art  跟 建立的模型对应， 而@art 是随便定义的变量名
  	@art = Art.new(art_params)

    if @art.save

      # redirect_to 保存之后的显示。通过此方法保存完之后跳转到show页面。
    	redirect_to arts_path
    else
      render 'new'
    end
    rescue RuntimeError => e
      @status = false
      @alert_text = e.message #e.message 等于raise后的字符串
      render "layouts/alert"
  end

  # 定义的show方法，即当保存完之后直接跳转到显示的页面，显示当前输入存储的数据
  def show
  	@art = Art.find(params[:id]) 
    render 'show'
  end 

  def index
    @art = Art.all 
  end

  # 一般放在show 和 private中间
  def update
    @art = Art.find(params[:id])

    if @art.update(art_params)
      redirect_to @art
    else 
      render 'edit'
    end 
  end

  def destroy 
    @art = Art.find(params[:id])
    Art.find(params[:id]).destroy 
    # 这里要写的是arts_path，因为这个根据路由查看是默认的index列表页面
      redirect_to arts_path
    
      # render plain: 'delete false'
    
  end

  

  # 定义的私有方法，上面的都是public，定义的私有art_params，此方法只能在此控制器中使用，\ 如果是受保护的，那么与此控制器相关联的控制器也可以使用
  private
  	def art_params
      # 允许的参数值array  就是在permit函数中指定Hash，\ 如将content去掉，那么新建的时候，将不会保存此字段属性值。require则是 要控制需要的art模型中的。\ 这里的artss是与新建的 new.html.erb提交的 form_for保持一致的。
  		params.require(:art).permit(:title, :content)
  	end
end
