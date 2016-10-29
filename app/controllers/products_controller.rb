class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:edit,:show,:update,:destroy]
  before_action :its_admin?


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
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Store was siccessfully updated'
      redirect_to product_path(id: @product.id, it_was: 'updated')
    else
      render edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product was successfully deleted.'
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def show
    @action = params[:it_was]
  end

  private

  def product_params
    params.require(:product).permit(:name,:reference,:price,:quantity,:brand,:description,:category_id,:image)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def its_admin?
    unless current_user.admin?
      redirect_to root_path, :alert => "Acceso denegado, no posee permisos como administrador"
    end
  end


end
