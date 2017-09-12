class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text    :url, null: false
      t.integer :hit_count, default: 0
    end
  end
end
