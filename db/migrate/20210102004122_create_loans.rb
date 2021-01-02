class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.integer :borrower_id
      t.integer :lender_id
      t.string :category
      t.integer :amount
      t.string :term

      t.timestamps
    end
  end
end
