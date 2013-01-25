require 'spec_helper'

describe OmniAuth::Strategies::Socialstream do
  let(:access_token) { stub('AccessToken', :options => {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', :parsed => parsed_response) }

  let(:other_site)          { 'https://some.other.site.com' }
  let(:other_authorize_url) { 'https://some.other.site.com/login/oauth/authorize' }
  let(:other_token_url)     { 'https://some.other.site.com/login/oauth/access_token' }
  let(:other) do
    OmniAuth::Strategies::Socialstream.new('SS_KEY', 'SS_SECRET',
        {
            :client_options => {
                :site => other_site,
                :authorize_url => other_authorize_url,
                :token_url => other_token_url
            }
        }
    )
  end

  subject do
    OmniAuth::Strategies::Socialstream.new({})
  end

  before(:each) do
    subject.stub!(:access_token).and_return(access_token)
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://demo-social-stream.dit.upm.es")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://demo-social-stream.dit.upm.es/oauth2/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://demo-social-stream.dit.upm.es/oauth2/token')
    end

    describe "should be overrideable" do
      it "for site" do
        other.options.client_options.site.should eq(other_site)
      end

      it "for authorize url" do
        other.options.client_options.authorize_url.should eq(other_authorize_url)
      end

      it "for token url" do
        other.options.client_options.token_url.should eq(other_token_url)
      end
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      access_token.should_receive(:get).with('user').and_return(response)
      subject.raw_info.should eq(parsed_response)
    end
  end
end
