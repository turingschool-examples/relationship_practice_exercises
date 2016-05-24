class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
