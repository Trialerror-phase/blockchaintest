class BlockchainController < ApplicationController
    def index
      render json: $blockchain.chain
    end
  
    def add_transaction
      $blockchain.add_transaction(params[:sender], params[:recipient], params[:quantity].to_i)
      render json: { message: "Transaction added!" }
    end
  
    def mine_block
      proof = $blockchain.proof_of_work($blockchain.chain.last[:nonce])
      $blockchain.create_block(proof, $blockchain.hash($blockchain.chain.last))
      render json: { message: "Block mined successfully!", chain: $blockchain.chain }
    end
  
    def tamper_block
      block = $blockchain.chain[params[:index].to_i]
      block[:transactions] << { sender: "Tampered", recipient: "Fake", quantity: 999 }
      render json: { message: "Block tampered!", chain: $blockchain.chain }
    end
  
    def validate_chain
      valid = $blockchain.valid_chain?
      render json: { valid: valid, message: valid ? "Blockchain is valid!" : "Blockchain has been tampered!" }
    end
  end
  
  # Initialize the blockchain if it's not already initialized
  def initialize_blockchain
    if $blockchain.nil?
      # Initialize a new blockchain instance here
      $blockchain = BlockChain.new
    end
  end
