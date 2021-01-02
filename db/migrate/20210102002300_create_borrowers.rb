class CreateBorrowers < ActiveRecord::Migration[6.0]
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :street_address
      t.string :city
      t.string :zipcode
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
