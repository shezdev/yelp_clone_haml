require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Carluccio\'s')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Carluccio\'s')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Carluccio\'s'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Carluccio\'s'
      expect(current_path).to eq '/restaurants'
    end

    context 'an invalid restaurant' do
      scenario 'does not let you submit a name that is too short' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'kf'
        click_button 'Create Restaurant'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing restaurants' do

    let!(:zefi){ Restaurant.create(name:'zefi') }

    scenario 'lets a user view a restaurant' do
     visit '/restaurants'
     click_link 'zefi'
     expect(page).to have_content 'zefi'
     expect(current_path).to eq "/restaurants/#{zefi.id}"
    end
  end

  context 'editing restaurants' do
    before { Restaurant.create name: 'Zefi', description: 'Healthy and home-made', id: 1 }
    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Zefi'
      fill_in 'Name', with: 'Zefi'
      fill_in 'Description', with: 'Healthy and home-made'
      click_button 'Update Restaurant'
      click_link 'Zefi'
      expect(page).to have_content 'Zefi'
      expect(page).to have_content 'Healthy and home-made'
      expect(current_path).to eq '/restaurants/1'
    end
  end

  context 'deleting restaurants' do

    before { Restaurant.create name: 'Zefi', description: 'Healthy and home-made' }

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete Zefi'
      expect(page).not_to have_content 'Zefi'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
