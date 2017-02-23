require 'rails_helper'

feature "User can sign in and out" do
  include Helpers


  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context 'user must be signed in to create restaurants' do

    it "should see 'Sign in' link" do
      visit('/')
      expect(page).to have_link('Sign in')
    end

    it "should be able to sign in" do
      sign_up_sign_in
      expect(page).to have_content('Signed in successfully.')
    end
  end
end
