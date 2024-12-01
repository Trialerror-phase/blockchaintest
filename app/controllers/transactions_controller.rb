class TransactionsController < ApplicationController
    before_action :authenticate_user
  
    # View all transactions for the current user
    def index
      @transactions = Transaction.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    end
  
    private
  
    def authenticate_user
      redirect_to root_path, alert: "Access denied." unless current_user
    end
  end
  