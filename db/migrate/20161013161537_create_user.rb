class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :token
      t.timestamps
    end
  end
end
