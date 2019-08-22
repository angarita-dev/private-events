require 'rails_helper'

describe "User's Registration" do
  it "Registers Users" do
    visit '/users/new'
    within("form") do
      fill_in 'user_name', with: "User"
      fill_in 'user_password', with: "rootroot"
      fill_in 'user_password_confirmation', with: "rootroot"
    end
    click_button 'submit'
    expect(page).to have_content "User"
  end

  it "Throws an error if name/password combination is incorrect" do
    create(:user, name: "User", password: "rootroot", password_confirmation: "rootroot")
    visit "/sessions/new"
    within("form") do
      fill_in 'user_name', with: "Other Thing"
      fill_in 'user_password_digest', with: "password123"
    end
    click_button 'submit'
    expect(page).to have_content "Wrong combination of user/password"
  end

  it "Log In Users" do
    create(:user, name: "User", password: "rootroot", password_confirmation: "rootroot")
    visit "/sessions/new"
    within("form") do
      fill_in 'user_name', with: "User"
      fill_in 'user_password_digest', with: "rootroot"
    end
    click_button 'submit'
    expect(page).to have_content "User"
  end

  it "Shows past and current events" do
    user = create(:user, name: "Test root", password: "rootroot", password_confirmation: "rootroot")
    create(:event, title: "First event", description: nil, creator_id: user.id, event_date: (Date.current + 2))
    create(:event, title: "Second event", description: nil, creator_id: user.id, event_date: (Date.current + 1))
    create(:event, title: "Third event", description: nil, creator_id: user.id, event_date: (Date.current - 2))
    visit "/"
    expect(page).to have_content "Upcomming Events" && "Previous Events"
  end

  it "Shows attendance in the Event page" do
    user = create(:user, name: "Test root", password: "rootroot", password_confirmation: "rootroot")
    event = create(:event, title: "An Event", description: nil, creator_id: user.id, event_date: (Date.current + 2))
    create(:user, name: "User", password: "rootroot", password_confirmation: "rootroot")
    visit "/sessions/new"
    within("form") do
      fill_in 'user_name', with: "User"
      fill_in 'user_password_digest', with: "rootroot"
    end
    click_button 'submit'
    visit "/events/#{event.id}"
    click_link 'Attend This Event!'
    expect(page).to have_content "You are now attending to this event" && "User"
  end

  it "Shows when you've stopped following an Event" do
    user = create(:user, name: "Test root", password: "rootroot", password_confirmation: "rootroot")
    event = create(:event, title: "An Event", description: nil, creator_id: user.id, event_date: (Date.current + 2))
    create(:user, name: "User", password: "rootroot", password_confirmation: "rootroot")
    visit "/sessions/new"
    within("form") do
      fill_in 'user_name', with: "User"
      fill_in 'user_password_digest', with: "rootroot"
    end
    click_button 'submit'
    visit "/events/#{event.id}"
    click_link 'Attend This Event!'
    click_link 'Stop attending'
    expect(page).to have_content "You are not attending to this event anymore"
  end

  it "Shows User created Events and Attendances" do
    test_root = create(:user, name: "Test root", password: "rootroot", password_confirmation: "rootroot")
    user = create(:user, name: "User", password: "rootroot", password_confirmation: "rootroot")
    create(:event, title: "User's First Event", description: nil, creator_id: user.id, event_date: (Date.current + 2))
    create(:event, title: "User's Second Event", description: nil, creator_id: user.id, event_date: (Date.current - 2))
    root_event = create(:event, title: "Root's First Event", description: nil, creator_id: test_root.id, event_date: (Date.current + 2))
    visit "/sessions/new"
    within("form") do
      fill_in 'user_name', with: "User"
      fill_in 'user_password_digest', with: "rootroot"
    end
    click_button 'submit'
    visit "/events/#{root_event.id}"
    click_link 'Attend This Event!'
    visit "/users/#{user.id}"
    expect(page).to have_content "Upcomming Events" && "Previous Events" && "Root's First Event"
  end
end
