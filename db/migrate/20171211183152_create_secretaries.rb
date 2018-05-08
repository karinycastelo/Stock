class CreateSecretaries < ActiveRecord::Migration[5.1]
  def change
    create_table :secretaries do |t|
      t.string :name
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
