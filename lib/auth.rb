require 'jwt'

class Auth
  ALGORITHM = 'HS256'.freeze

  def self.issue(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, auth_secret, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
  end

  def self.valid_payload(payload)
    if payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
      false
    else
      true
    end
  end

  def self.auth_secret
    ENV["AUTH_SECRET"]
  end

  def self.meta
    {
      iss: 'issuer_name',
      aud: 'client'
    }
  end
end
