class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :action
      t.text :notes

      t.timestamps
    end
  end
end
