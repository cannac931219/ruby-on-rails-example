class BooklistsController < ApplicationController

	def new

  end

	def create
    @art = Art.find(params[:art_id])
    # @book = @art.booklist.create(book_params)
    # redirect_to art_path(@art)

    @booklist = Booklist.create(book_params.merge({:art_id=>@art.id}))
    redirect_to art_path(@art)

    # render json: @booklist

    
  end



 	def destroy
    @art = Art.find(params[:art_id])
    # @book = @art.booklist.find(params[:id])
    @book = @art.booklist[:id]
    @booklist = @art.booklist
    # @book.destroy
    @booklist.destroy
    # binding.pry
    redirect_to arts_path
  end

  def show
  end

  def update
    @art = Art.find(params[:art_id])
    @booklist = @art.booklist
    @book = @art.booklist[:id]
    if @booklist.update(book_params)
      redirect_to art_path(@art)
    end
  end
  

  private
    def book_params
      params.require(:booklist).permit(:body)
    end
end
