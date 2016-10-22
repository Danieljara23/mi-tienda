class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = 'The product have been saved'
        redirect_to product_path(id: @product.id, it_was: 'created')
      else
        render :new
      end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Store was siccessfully updated'
      redirect_to product_path(id: @product.id, it_was: 'updated')
    else
      render edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product was successfully deleted.'
    redirect_to products_path
  end

  def index
    @products = Product.all
  end



  def show
    @product = Product.find(params[:id])
    @action = params[:it_was]
  end

  private
  def product_params
    params.require(:product).permit(:name,:reference,:price,:quantity,:brand,:description)
  end
end
