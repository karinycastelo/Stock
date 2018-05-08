class CreateSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :address
      t.references :secretary, foreign_key: true

      t.timestamps
    end
  end
end
