class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :email
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :email
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.send_password_reset(self).deliver
  end


end
