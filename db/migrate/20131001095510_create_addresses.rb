class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.timestamps
    end
  end
end
