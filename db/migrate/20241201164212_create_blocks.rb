class CreateBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :blocks do |t|
      t.integer :index
      t.integer :nonce
      t.string :previous_hash
      t.text :data
      t.datetime :timestamp

      t.timestamps
    end
  end
end
