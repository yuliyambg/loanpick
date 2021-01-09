class AddColumnAcceptToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :accept, :boolean, default: false
  end
end
