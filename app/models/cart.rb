class Cart < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validate :user_must_be_regular_user
  
  def self.book_already_in_cart?(user_id, book_id)
    where(user_id: user_id, book_id: book_id).exists?
  end

  private

  def user_must_be_regular_user
    unless user.user_role == 'user'
      errors.add(:user_id, "must belong to a regular user")
    end
  end

end
