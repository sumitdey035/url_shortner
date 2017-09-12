class CreateShortenUrls < ActiveRecord::Migration
  def change
    create_table :shorten_urls, id: false do |t|
      t.string      :uniq_id,     primary_key: true
      t.references  :url,         null: false, index: true, foreign_key: true
      t.timestamp   :expired_at,  null: false

      t.timestamps null: false
    end
  end
end
