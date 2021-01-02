class CreateLenders < ActiveRecord::Migration[6.0]
  def change
    create_table :lenders do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :zipcode
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
