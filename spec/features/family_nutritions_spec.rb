require 'spec_helper'

describe "family nutrition eligibility" do
  it "qualifies household size of 1 and 90 day income of 3646.87" do
    visit '/family_nutritions/new'
    within("#new_family_nutrition") do
      fill_in 'nutrition_household_size', :with => '1'
      fill_in 'nutrition_gross_income', :with => '3646.87'
    end
    click_button 'See if I qualify'
    expect(page).to have_content 'You may be in luck!'
  end
end
