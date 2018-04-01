class CreateShortenUrls < ActiveRecord::Migration
  def change
    create_table :shorten_urls do |t|
      t.string      :uniq_id, unique: true
      t.references  :url,         null: false, index: true, foreign_key: true
      t.timestamp   :expired_at,  null: false
      t.timestamps null: false
    end
    add_index :shorten_urls, :uniq_id, unique: true
  end
end
