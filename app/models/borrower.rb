class Borrower < ApplicationRecord
  has_secure_password
  has_many :loans
  has_many :lenders, through: :loans

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true
  validates :email,
            format: { with: /@/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }

  validates_format_of :zipcode,
                      :with => %r{\d{5}(-\d{4})?},
                      :message => "should be 12345 or 12345-1234"

  validates :password, presence:true
  # validates :password, length: { in: 6..20 }
  # validates_presence_of :password_confirmation

end
