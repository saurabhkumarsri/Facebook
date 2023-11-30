class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :description
      t.boolean :verified, default: false
      t.integer :contact

      t.timestamps
    end
  end
end
