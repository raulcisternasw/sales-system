class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :gender
      t.datetime :date_of_birth
      t.string :phone

      t.timestamps
    end
  end
end
