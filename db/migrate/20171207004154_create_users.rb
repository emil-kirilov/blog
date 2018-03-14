class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :creator, references: :users

      t.string :name, null: false, default: ""
      t.string :role, null: false, default: "user"

      t.timestamps null:false
    end
  end
end
