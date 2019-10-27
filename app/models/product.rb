class Product < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  validates_with MyCustomPriceValidator

  def user_updated_price(user)
    self.update_attribute(:user_updated_price, user.id)
  end
end
