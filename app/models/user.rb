class User < ApplicationRecord

  before_validation :lowercase_emails

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensetive => false

  has_secure_password


  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase unless email.nil?
    user = self.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private

  def lowercase_emails
    self.email = email.downcase
  end

end
