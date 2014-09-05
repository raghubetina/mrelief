require 'spec_helper'

describe "vision assistance eligibility" do
  it "qualifies case management yes, household size of 1, and 90 day income of 3646.87" do
    visit '/visions/new'
    within("#new_vision") do
      choose('case_management_yes')
      fill_in 'vision_household_size', :with => '1'
      fill_in 'vision_gross_income', :with => '3646.87'
    end
    click_button 'See if I qualify'
    expect(page).to have_content 'You may be in luck!'
  end
end
