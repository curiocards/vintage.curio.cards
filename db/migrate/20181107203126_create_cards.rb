class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :ipfs
      t.string :card_name
      t.string :card_addr
      t.text :description
      t.timestamp :publish_date
      t.integer :max_supply
      t.integer :remaining_supply
      t.string :vend_addr
      t.decimal :vend_price

      t.timestamps
    end
  end
end
