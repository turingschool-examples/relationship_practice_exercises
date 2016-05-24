class AddColumnForReportsToToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :reports_to_id, :integer
  end
end
