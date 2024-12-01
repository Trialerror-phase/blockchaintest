# spec/services/blockchain_spec.rb
require 'rails_helper'

RSpec.describe Blockchain, type: :service do
  let(:blockchain_service) { Blockchain.new }

  describe '#create_wallet' do
    it 'creates a new wallet' do
      result = blockchain_service.create_wallet
      expect(result).to be_a(Hash) # Adjust based on what the method returns
      expect(result).to have_key(:address) # Example of expected outcome
    end
  end

  describe '#get_balance' do
    it 'returns the balance of the wallet' do
      wallet = blockchain_service.create_wallet
      balance = blockchain_service.get_balance(wallet[:address])
      expect(balance).to be_a(Numeric)
    end
  end
end
