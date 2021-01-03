class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :lender
  validates :amount, :inclusion => 1..50000
  # validates :category, inclusion: { in: %w[Student HIL Consolidation] }

  scope :student, -> { where(category: "Student") }
  scope :hil, -> { where(category: "HIL") }
  scope :consolidation, -> { where(category: "Consolidation") }
  scope :fixed, -> { where(term: "120 months fixed") }
  scope :variable, -> { where(term: "180 months variable")}

end
