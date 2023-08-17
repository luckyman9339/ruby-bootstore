class BookController < ApplicationController
  # include AuthenticateUser

  def index
    @books = Book.all
  end

  def show
  end

  def new
    if User.find_by(id: session[:user_id]).user_role == "admin"
      @book = Book.new
    else
      redirect_to root_path, notice: "only admin have acess to admin panel"
    end
  end

  def create
      @book = Book.new( params.require(:book).permit(:title, :description, :author, :genre, :cover_image))
  end

  def edit
  end

  def destroy
  end
end
