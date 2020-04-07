feature 'capybara properly set up' do
  scenario 'Index page says Hello world' do
    visit '/'
    expect(page).to have_content('Hello world')
  end
end
