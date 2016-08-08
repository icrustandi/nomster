require 'spec_helper'

describe 'home page' do
  it 'contains site title' do
    visit ('/')
    expect(page).to have_content('HappyMunch')
  end
end

describe "log in process", :type => :feature do
  before :each do
    visit '/users/sign_up'
    page.fill_in 'Email', :with => 'user@example.com'
    page.fill_in 'Password', :match => :first, :with => 'password'
    page.fill_in 'Password confirmation', :with => 'password'

    click_button 'Sign Up'
    expect(page).to have_content('signed up successfully')
    click_on 'Log Out'
    expect(page).to have_content('Signed out successfully')
  end

  it "signs me in" do
    visit '/users/sign_in'
    page.fill_in 'Email', :with => 'user@example.com'
    page.fill_in 'Password', :with => 'password'
  click_button 'Log in'
  expect(page).to have_content('Signed in successfully')
  end
end
