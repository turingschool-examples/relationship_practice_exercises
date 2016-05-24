class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :composer
      t.integer :milliseconds
      t.decimal :unit_price
      t.integer :bytes
      t.references :genre, index: true, foreign_key: true
      t.references :album, index: true, foreign_key: true
      t.references :media_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
