class CreateDeparts < ActiveRecord::Migration[6.0]
  def change
    create_table :departs do |t|
      t.string     :post_cord,null:    false
      t.integer    :area_id,null:      false
      t.string     :municipalities,    null: false
      t.string     :address,           null: false
      t.string     :building
      t.string     :telephone,         null: false
      t.references :order,             null: false, foreign_key: true 
      t.timestamps
    end
  end
end
