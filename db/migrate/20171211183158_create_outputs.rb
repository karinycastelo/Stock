class CreateOutputs < ActiveRecord::Migration[5.1]
  def change
    create_table :outputs do |t|
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
