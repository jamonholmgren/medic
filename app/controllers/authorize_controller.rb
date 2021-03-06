class AuthorizeController < BaseController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor
    self.title = "Authorize"
  end

  def viewDidAppear(animated)
    if Medic.available?

      types = {
        share: [
          :body_mass_index,
          :body_fat_percentage,
          :height,
          :body_mass,
          :lean_body_mass,
          :step_count,
          :distance_walking_running,
          :distance_cycling,
          :basal_energy_burned,
          :active_energy_burned,
          :flights_climbed,
          :heart_rate,
          :body_temperature,
          :blood_pressure_systolic,
          :blood_pressure_diastolic,
          :respiratory_rate,
          :oxygen_saturation,
          :peripheral_perfusion_index,
          :blood_glucose,
          :number_of_times_fallen,
          :electrodermal_activity,
          :inhaler_usage,
          :blood_alcohol_content,
          :forced_vital_capacity,
          :forced_expiratory_volume1,
          :peak_expiratory_flow_rate,
          :dietary_biotin,
          :dietary_caffeine,
          :dietary_calcium,
          :dietary_carbohydrates,
          :dietary_chloride,
          :dietary_cholesterol,
          :dietary_chromium,
          :dietary_copper,
          :dietary_energy_consumed,
          :dietary_fat_monounsaturated,
          :dietary_fat_polyunsaturated,
          :dietary_fat_saturated,
          :dietary_fat_total,
          :dietary_fiber,
          :dietary_folate,
          :dietary_iodine,
          :dietary_iron,
          :dietary_magnesium,
          :dietary_manganese,
          :dietary_molybdenum,
          :dietary_niacin,
          :dietary_pantothenic_acid,
          :dietary_phosphorus,
          :dietary_potassium,
          :dietary_protein,
          :dietary_riboflavin,
          :dietary_selenium,
          :dietary_sodium,
          :dietary_sugar,
          :dietary_thiamin,
          :dietary_vitamin_a,
          :dietary_vitamin_b12,
          :dietary_vitamin_b6,
          :dietary_vitamin_c,
          :dietary_vitamin_d,
          :dietary_vitamin_e,
          :dietary_vitamin_k,
          :dietary_zinc,
          :sleep_analysis,
          :workout
        ],
        read: [
          :body_mass_index,
          :body_fat_percentage,
          :height,
          :body_mass,
          :lean_body_mass,
          :step_count,
          :distance_walking_running,
          :distance_cycling,
          :basal_energy_burned,
          :active_energy_burned,
          :flights_climbed,
          :nike_fuel,
          :heart_rate,
          :body_temperature,
          :blood_pressure_systolic,
          :blood_pressure_diastolic,
          :respiratory_rate,
          :oxygen_saturation,
          :peripheral_perfusion_index,
          :blood_glucose,
          :number_of_times_fallen,
          :electrodermal_activity,
          :inhaler_usage,
          :blood_alcohol_content,
          :forced_vital_capacity,
          :forced_expiratory_volume1,
          :peak_expiratory_flow_rate,
          :dietary_biotin,
          :dietary_caffeine,
          :dietary_calcium,
          :dietary_carbohydrates,
          :dietary_chloride,
          :dietary_cholesterol,
          :dietary_chromium,
          :dietary_copper,
          :dietary_energy_consumed,
          :dietary_fat_monounsaturated,
          :dietary_fat_polyunsaturated,
          :dietary_fat_saturated,
          :dietary_fat_total,
          :dietary_fiber,
          :dietary_folate,
          :dietary_iodine,
          :dietary_iron,
          :dietary_magnesium,
          :dietary_manganese,
          :dietary_molybdenum,
          :dietary_niacin,
          :dietary_pantothenic_acid,
          :dietary_phosphorus,
          :dietary_potassium,
          :dietary_protein,
          :dietary_riboflavin,
          :dietary_selenium,
          :dietary_sodium,
          :dietary_sugar,
          :dietary_thiamin,
          :dietary_vitamin_a,
          :dietary_vitamin_b12,
          :dietary_vitamin_b6,
          :dietary_vitamin_c,
          :dietary_vitamin_d,
          :dietary_vitamin_e,
          :dietary_vitamin_k,
          :dietary_zinc,
          :sleep_analysis,
          :biological_sex,
          :blood_type,
          :date_of_birth,
          :workout
        ]
      }

      Medic.authorize types do |success, error|
        NSLog "Authorized!"
      end

      Medic.enable_background_delivery :step_count, :hourly do |success, error|
        NSLog "This worked!"
      end
    end
  end

end
