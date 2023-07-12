class ChangeRateDataTypeInReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rate, :integer
  end
end
