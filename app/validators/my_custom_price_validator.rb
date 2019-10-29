class MyCustomPriceValidator < ActiveModel::Validator
  def validate(record)
    return if record.price_changed? && record.price > record.price_was

    record.errors[:base] << "You can not reduce the price!"
  end
end
