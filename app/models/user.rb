class User < ApplicationRecord

  before_validation :lowercase_emails

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensetive => false

  has_secure_password

  private

  def lowercase_emails
    self.email = email.downcase
  end


end
