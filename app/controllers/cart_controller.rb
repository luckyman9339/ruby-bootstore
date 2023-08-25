class CartController < ApplicationController
  skip_before_action :verify_authenticity_token

def index
  user_id = JWT.decode(session[:user], 'abcd', true, algorithm: 'HS256')[0]["user_id"]
  @cart_items = Cart.where(user_id: user_id).includes(:book)
  @total = Cart.total_price(@cart_items)
end

def create
  book_id = params[:book_id]
  user_id = params[:user_id]
  quantity = params[:quantity]

  if Cart.book_already_in_cart?(user_id, book_id)
    cart_item = Cart.find_by(user_id: user_id, book_id: book_id)
    if cart_item.quantity != quantity
      cart_item.update(quantity: quantity)
      render json: { message: 'Item quantity updated in cart' }, status: :ok
    else
      render json: { message: 'Item already in cart with the same quantity' }, status: :ok
    end
    redirect_to cart_index_path

  else
    cart_item = Cart.new(book_id: book_id, user_id: user_id, quantity: quantity)
    if cart_item.save
      render json: { message: 'Item added to cart successfully' }, status: :ok
    else
      render json: { error: 'Failed to add item to cart' }, status: :unprocessable_entity
    end
  end
end

def destroy
  Cart.find(params[:id]).destroy
  redirect_to cart_index_path
end

def update
  Cart.find(params[:id]).update(quantity: params[:quantity])
end

end
