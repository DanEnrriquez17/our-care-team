class AddRecommendationToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :recommendation, :text
  end
end
