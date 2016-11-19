class ProductosController < ApplicationController
  def index
  		@productos_restaurante = Product.all
  end
end
