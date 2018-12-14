class User < ApplicationRecord
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_and_belongs_to_many :degrees

  def self.from_omniauth(auth)
    user = find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
    return user
  end
end
