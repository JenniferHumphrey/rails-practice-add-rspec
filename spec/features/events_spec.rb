require 'rails_helper'

feature 'Events' do

  scenario 'User adds an event' do
    visit root_path
    click_on 'New Event'
    fill_in 'Description', with: 'Party at Dylans'
    fill_in 'Location', with: 'Disneyland'
    fill_in 'Date', with: 'event.date'
    fill_in 'Capacity', with: '500'
    check 'Requires ID'
    click_on 'Create Event'
  end

  scenario 'User edits an event' do
    Event.create!(
      description: 'My aweeesome event'
    )

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'

    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')
  end
  scenario 'User deletes and event' do
    Event.create!(
      description: 'My aweeesome event'
    )
    visit root_path
    click_on 'delete'
    expect(page).to have_no_content('My aweeesome event')
  end
  scenario 'User can view an event' do
    Event.create!(
      description: 'Party at Steves'
    )
    visit root_path
    click_on 'Party at Steves'

    expect(page).to have_content('Party at Steves')
  end

end
