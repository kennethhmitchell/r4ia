require "rails_helper"

RSpec.feature "Admins can manage states" do
 let(:user) { FactoryGirl.create(:user, :admin) }
 let!(:state) { FactoryGirl.create(:state, name: "New") }
 before do
  login_as(user)
  visit admin_states_path
 end

 scenario "to set the default state" do
  within list_item("New") do
   click_link "Make Default"
  end

  expect(page).to have_content "'New' is now the default state"
 end
end
