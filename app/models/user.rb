class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, { case_sensitive: false }
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: {in: 6..20}

  def self.authenticate_with_credentials(param1, param2)
    user = User.find_by_email(param1)
    p "====HERE==== #{user}"
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(param2)
      p "====HERE==== #{user}"
      user
    else
      nil
    end
  end

end