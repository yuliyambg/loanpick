class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :lender
end
