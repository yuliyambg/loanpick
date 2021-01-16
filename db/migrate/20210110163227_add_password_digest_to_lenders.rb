class AddPasswordDigestToLenders < ActiveRecord::Migration[6.0]
  def change
    add_column :lenders, :password_digest, :string
  end
end
