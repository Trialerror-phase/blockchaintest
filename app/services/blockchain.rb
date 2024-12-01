class Blockchain
    attr_reader :chain, :pending_transactions
  
    def initialize
      @chain = []
      @pending_transactions = []
      create_genesis_block
    end
  
    # Create the genesis block (the first block in the blockchain)
    def create_genesis_block
      genesis_block = Block.new(0, "0", "Genesis Block", Time.now.to_i)
      @chain << genesis_block
    end
  
    # Add a new block to the blockchain
    def add_block(data)
      previous_block = @chain.last
      new_block = Block.new(previous_block.index + 1, previous_block.hash, data, Time.now.to_i)
      if valid_new_block?(new_block, previous_block)
        @chain << new_block
        @pending_transactions.clear # Once a block is added, clear the pending transactions
      end
    end
  
    # Validate the new block to ensure immutability
    def valid_new_block?(new_block, previous_block)
      new_block.previous_hash == previous_block.hash && valid_hash?(new_block)
    end
  
    # Validate the block's hash (this ensures integrity)
    def valid_hash?(block)
      block.hash == block.calculate_hash
    end
  end
  