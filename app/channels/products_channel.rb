class ProductsChannel < ApplicationCable::Channel
  def follow
    stream_from 'products'
  end
end
