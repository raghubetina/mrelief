class HousingAssistancesController < ApplicationController
  def index
    @housing_assistances = HousingAssistance.all
  end

  def show
    @housing_assistance = HousingAssistance.find(params[:id])
  end

  def new
    @housing_assistance = HousingAssistance.new
  end

  def create
   housing_dependent_no = params[:housing_dependent_no].to_i
    housing_gross_income = params[:housing_gross_income]
    housing_gross_income = housing_gross_income.gsub(/[^0-9\.]/, '').to_i

    if housing_gross_income.present? && housing_dependent_no.present?

         housing_eligibility = HousingAssistance.find_by({ :housing_dependent_no => params[:housing_dependent_no] })


       p "housing_gross_income = #{housing_gross_income}"
       p "housing_eligibility.housing_gross_income = #{housing_eligibility.housing_gross_income}"

       if housing_gross_income < housing_eligibility.housing_gross_income
         @eligible = true
       else

        end
     else
       redirect_to :back, :notice => "All fields are required."
     end
  end
end

