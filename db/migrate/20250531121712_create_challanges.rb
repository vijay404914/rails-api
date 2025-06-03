class CreateChallanges < ActiveRecord::Migration[7.1]
  def change
    create_table :challanges do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
