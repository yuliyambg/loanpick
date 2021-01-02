class Lender < ApplicationRecord
  has_many :loans
  has_many :borrowers, through: :loans
end
