class Student < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  validates :cell_phone, :home_phone, :work_phone, presence: true, length: {maximum: 15},
    format: { with: VALID_PHONE_NUMBER_REGEX }
end
