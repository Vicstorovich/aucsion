class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    product.user_updated_price(current_user)

    if product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      if product.user_id == current_user
        render :edit
      else
        render :show
      end
    end
  end


  def destroy
    product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def product
    @product = Product.find(params[:id])
  end
  helper_method :product

  def product_params
    params.require(:product).permit(:title, :price, :user_updated_price)
  end
end
