class FarmersController < ApplicationController
    before_action :authenticate_farmer
  
    # Verify product source
    def verify_product
      product = Product.find_by(batch_number: params[:batch_number])
      if product
        render json: { source: product.user.name, description: product.description }
      else
        render json: { error: "Product not found." }, status: :not_found
      end
    end
  
    # Report tampered products
    def report_tampered_product
      supplier = User.find_by(id: params[:supplier_id], role: :supplier)
      if supplier
        SupplierMailer.report_tampered(params[:batch_number], supplier.email).deliver_now
        flash[:notice] = "Report sent successfully."
      else
        flash[:alert] = "Failed to send report."
      end
      redirect_to farmer_dashboard_path
    end
  
    private
  
    def authenticate_farmer
      redirect_to root_path, alert: "Access denied." unless current_user&.farmer?
    end
  end
  