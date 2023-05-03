class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_regex
  validates :email, uniqueness: true
  validates :username, uniqueness: true, length: { maximum: 15 }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/

    errors.add :password, 'Password should have more than 8-30 characters, including 1 uppercase letter, 1 number, 1 special character'
  end
end