class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :customer, index: true, foreign_key: true
      t.string :photo
      t.string :cc_number
      t.string :password

      t.timestamps null: false
    end
  end
end
