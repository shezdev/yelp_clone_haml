module Helpers
  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_sign_in
    sign_up
    click_link('Sign out')
    visit('/')
    click_link('Sign in')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    click_button('Log in')
  end

  def sign_up_user_2
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'user2@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end


end
