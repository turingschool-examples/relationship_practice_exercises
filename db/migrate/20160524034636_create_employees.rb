class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email
      t.string :fax
      t.string :phone
      t.integer :postal_code_id
      t.string :address
      t.string :hire_date
      t.string :birth_date
      t.string :title
      t.string :last_name
      t.string :first_name
      t.integer :reports_to

      t.timestamps null: false
    end
  end
end
