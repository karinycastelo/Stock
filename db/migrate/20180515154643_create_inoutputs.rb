class CreateInoutputs < ActiveRecord::Migration[5.1]
  def change
    create_table :inoutputs do |t|
      t.string :name
      t.integer :quantity
      t.references :sector, foreign_key: true
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end