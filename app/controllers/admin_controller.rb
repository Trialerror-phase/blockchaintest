class AdminController < ApplicationController
    before_action :authenticate_admin
  
    # View all transactions
    def transactions
      @transactions = Transaction.all
    end
  
    # Add a new user (Supplier, Retailer, Farmer)
    def add_user
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "User added successfully."
        redirect_to admin_dashboard_path
      else
        flash[:alert] = "Failed to add user."
        render :new_user
      end
    end
  
    private
  
    def authenticate_admin
      redirect_to root_path, alert: "Access denied." unless current_user&.administrator?
    end
  
    def user_params
      params.require(:user).permit(:name, :role, :email)
    end
  end
  