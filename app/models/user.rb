class User < ApplicationRecord
    enum role: { administrator: "administrator", supplier: "supplier", retailer: "retailer", farmer: "farmer" }
  
    validates :name, :role, :email, presence: true
  end
  