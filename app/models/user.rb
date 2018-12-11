class User < ApplicationRecord
  # attr_accessible :provider,
  #                 :uid,
  #                 :name,
  #                 :oauth_token,
  #                 :oauth_expires_at

  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :declarations
  has_many :degrees, through: :declarations

  def self.from_omniauth(auth)
    user = find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
    return user
  end
end
