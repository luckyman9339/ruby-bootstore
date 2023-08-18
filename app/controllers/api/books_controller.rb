module Api
  class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_book, only: [:show, :update, :destroy]
    before_action :authenticate_request
  
    include AuthenticateUser
    before_action :authorize_admin, only: [:new, :edit, :destroy]

    def index
      @books = Book.all
      render json: @books
    end

    def show
      render json: @book
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        render json: @book, status: :created
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end

    def update
      if @book.update(book_params)
        render json: @book
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @book.destroy
      head :no_content
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:author, :title, :genre, :description, :cover_image)
    end

    def authenticate_request
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, 'abcd', true, algorithm: 'HS256')
      @current_user = User.find(decoded_token.first['user_id'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end

  end
end
