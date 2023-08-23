class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.total_price(cart_items)
    total_price = cart_items.sum { |cart_item| cart_item.quantity * cart_item.book.price }
    total_price
  end

end
