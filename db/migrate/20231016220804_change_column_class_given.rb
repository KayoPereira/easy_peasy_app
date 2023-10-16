class ChangeColumnClassGiven < ActiveRecord::Migration[7.0]
  def change
    change_column_default :students, :class_given, from: nil, to: 0
  end
end
