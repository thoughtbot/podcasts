require 'spec_helper'

describe User do
  describe '.find_or_create_for_google_oauth2' do
    it 'returns the user with the given email address' do
      user = create(:user)

      found_user = User.find_or_create_for_google_oauth2(
        auth_token(user.email)
      )

      expect(found_user).to eq user
    end

    it 'creates a user for users with a thoughtbot email' do
      created_user = User.find_or_create_for_google_oauth2(
        auth_token('someone@thoughtbot.com')
      )

      expect(created_user).not_to be_nil
    end

    it 'does not create user for users without a thoughtbot email' do
      created_user = User.find_or_create_for_google_oauth2(
        auth_token('someone@notthoughtbot.com')
      )

      expect(created_user).to be_nil
    end

    def auth_token(email)
      double(info: { 'email' => email })
    end
  end
end
