require 'open-uri'
require 'base64'
require 'json'
require 'faraday'

require_relative './client'
require_relative 'apis/public'
require_relative 'apis/lists'
require_relative 'apis/metrics'
require_relative 'apis/profiles'
require_relative 'apis/campaigns'

module Klaviyo
  class << self 
    def public_api_key
      RequestStore.store[:klaviyo_public_api_key]
    end

    def public_api_key=(value)
      RequestStore.store[:klaviyo_public_api_key] = value
    end

    def private_api_key
      RequestStore.store[:klaviyo_private_api_key]
    end

    def private_api_key=(value)
      RequestStore.store[:klaviyo_private_api_key] = value
    end
  end

  class KlaviyoError < StandardError; end

  NO_PRIVATE_API_KEY_ERROR = 'Please provide your Private API key for this request'
  NO_PUBLIC_API_KEY_ERROR = 'Please provide your Public API key for this request'
  REQUIRED_ARG_ERROR = 'You must identify a user by email, ID or phone_number'
end
