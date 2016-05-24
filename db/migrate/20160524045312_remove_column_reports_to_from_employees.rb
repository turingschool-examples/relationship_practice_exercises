class RemoveColumnReportsToFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :reports_to, :integer
  end
end
