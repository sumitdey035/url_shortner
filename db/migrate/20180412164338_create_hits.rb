class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.references :shorten_url, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
