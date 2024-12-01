class RetailerController < ApplicationController
    before_action :authenticate_retailer
  
    # View products received from suppliers
    def received_products
      @products = Product.where(user_id: current_user.id)
    end
  
    # Mark product as sold
    def mark_as_sold
      @product = Product.find(params[:id])
      if @product.update(sold: true)
        flash[:notice] = "Product marked as sold."
      else
        flash[:alert] = "Failed to mark product as sold."
      end
      redirect_to retailer_dashboard_path
    end
  
    private
  
    def authenticate_retailer
      redirect_to root_path, alert: "Access denied." unless current_user&.retailer?
    end
  end
  