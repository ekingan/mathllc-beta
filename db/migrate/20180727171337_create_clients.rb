class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :tax_id
      t.string :email
      t.integer :entity

      t.timestamps
    end
  end
end
