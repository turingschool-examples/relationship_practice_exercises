class AddAttributesToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :genre, index: true, foreign_key: true
    add_column :tracks, :milliseconds, :integer
    add_column :tracks, :composer, :string
  end
end
