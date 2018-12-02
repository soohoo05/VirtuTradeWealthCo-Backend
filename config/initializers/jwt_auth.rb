require 'jwt'

class JwtAuth
  def self.encode(payload)
    expire_at = (DateTime.now + 4.hours).to_i
    new_payload = {data: payload, exp: expire_at}
    JWT.encode(new_payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base).first.with_indifferent_access
  rescue
    {error: "Invalid token"}
  end
end