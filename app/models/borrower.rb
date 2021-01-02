class Borrower < ApplicationRecord
  has_many :loans
  has_many :lenders, through: :loans
end
