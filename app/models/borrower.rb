class Borrower < ApplicationRecord
  has_secure_password
  has_many :loans
  has_many :lenders, through: :loans
end
