require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SocialStream < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://demo-social-stream.dit.upm.es',
        :authorize_url => 'https://demo-social-stream.dit.upm.es/login/oauth/authorize',
        :token_url => 'https://demo-social-stream.dit.upm.es/login/oauth/access_token'
      }

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['slug'],
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'image' => raw_info['avatar_url'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('user').parsed
      end
    end
  end
end
