class Block < ApplicationRecord
    
        attr_accessor :index, :previous_hash, :data, :timestamp, :hash
      
        def initialize(index, previous_hash, data, timestamp)
          @index = index
          @previous_hash = previous_hash
          @data = data
          @timestamp = timestamp
          @hash = calculate_hash
        end
      
        # Calculate the hash of the block
        def calculate_hash
          Digest::SHA256.hexdigest("#{@index}#{@previous_hash}#{@data}#{@timestamp}")
        end
      class Block
  attr_accessor :index, :previous_hash, :data, :timestamp, :hash

  def initialize(index, previous_hash, data, timestamp)
    @index = index
    @previous_hash = previous_hash
    @data = data
    @timestamp = timestamp
    @hash = calculate_hash
  end

  # Calculate the hash of the block
  def calculate_hash
    Digest::SHA256.hexdigest("#{@index}#{@previous_hash}#{@data}#{@timestamp}")
  end
end

      
end
