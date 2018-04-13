class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.references :shorten_url, index: true, foreign_key: true
      t.string :ip_address
      t.string :country_code
      t.string :country_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.string :zip_code
      t.string :time_zone
      t.decimal :latitude
      t.decimal :longitude
      t.string :metro_code
      t.timestamps null: false
    end
  end
end
