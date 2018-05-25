class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :code, unique: true
      t.string :name
      t.string :description
      t.integer :patrimony, unique: true
      t.references :type, foreign_key: true
      t.references :sector, foreign_key: true
      t.integer :quantity
      t.references :user, foreign_key: true
      t.boolean :rent
      t.references :enterprise, foreign_key: true, optional: true

      t.timestamps
    end
  end
end