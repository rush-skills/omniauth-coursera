require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Coursera < OmniAuth::Strategies::OAuth2
      option :client_options, {
          site: 'https://accounts.coursera.org',
          authorize_url: 'https://accounts.coursera.org/oauth2/v1/auth',
          token_url: 'https://accounts.coursera.org/oauth2/v1/token'
      }

      def request_phase
        super
      end

      uid do
        raw_info['elements'].first['id'].to_s
      end

      info do
        {
          name: raw_info['elements'].first['name'],
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('https://api.coursera.org/api/externalBasicProfiles.v1?q=me&fields=name').parsed
      end
    end
  end
end
