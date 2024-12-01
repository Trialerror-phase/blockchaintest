class SupplierController < ApplicationController
    before_action :authenticate_supplier
  
    # Register a product
    def register_product
      @product = current_user.products.new(product_params)
      if @product.save
        flash[:notice] = "Product registered successfully."
        redirect_to supplier_dashboard_path
      else
        flash[:alert] = "Failed to register product."
        render :new_product
      end
    end
  
    # View all retailers
    def view_retailers
      @retailers = User.where(role: :retailer)
    end
  
    # Transfer products to a retailer
    def transfer_product
      @product = Product.find(params[:id])
      retailer = User.find_by(id: params[:retailer_id], role: :retailer)
      if retailer
        @product.update(user: retailer)
        Transaction.create(sender_id: current_user.id, recipient_id: retailer.id, product_id: @product.id)
        flash[:notice] = "Product transferred successfully."
      else
        flash[:alert] = "Failed to transfer product."
      end
      redirect_to supplier_dashboard_path
    end
  
    private
  
    def authenticate_supplier
      redirect_to root_path, alert: "Access denied." unless current_user&.supplier?
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :batch_number)
    end
  end
  