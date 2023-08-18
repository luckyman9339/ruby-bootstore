class BookController < ApplicationController
  
  include AuthenticateUser

  before_action :authorize_admin, only: [:new, :edit, :destroy]

  def index
    @books = Book.all
  end
  
  def show
  end
  
  def new
    @book = Book.new
  end

  def create
      @book = Book.new( params.require(:book).permit(:title, :description, :author, :genre, :cover_image))
  end

  def edit
  end

  def destroy
  end

end
