class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers:[:vkontakte]
  has_many :cards

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def password_required?
    false
  end

  def password_changed?
    false
  end

end
