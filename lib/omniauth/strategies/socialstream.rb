require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Socialstream < OmniAuth::Strategies::OAuth2
      option :name, 'socialstream'

      option :client_options, {
        :site => 'https://demo-social-stream.dit.upm.es',
        :authorize_url => 'https://demo-social-stream.dit.upm.es/oauth2/authorize',
        :token_url => 'https://demo-social-stream.dit.upm.es/oauth2/token'
      }

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['nickName'],
          'email' => raw_info['email'],
          'name' => raw_info['displayName'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('profile.json', params: { access_token: access_token.token }).parsed
      end
    end
  end
end

