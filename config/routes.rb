Rails.application.routes.draw do
  root 'home#index'

  # Blockchain-related actions
  get 'blockchain', to: 'blockchain#index'
  get 'blockchain/validate_chain', to: 'blockchain#validate_chain'

  # Admin actions
  get 'admin', to: 'admin#index'
  post 'admin/add_user', to: 'admin#add_user'

  # Supplier actions
  get 'supplier', to: 'suppliers#index'
  post 'supplier/new_product', to: 'suppliers#create'

  # Retailer actions
  get 'retailer', to: 'retailers#index'
  post 'retailer/mark_as_sold', to: 'retailers#mark_as_sold'

  # Farmer actions
  get 'farmer', to: 'farmers#index'
  post 'farmer/verify_product', to: 'farmers#verify'
  post 'farmer/report_tampered', to: 'farmers#report_tampered'
end
