class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :monthly_lessons
      t.string :language
      t.string :level
      t.string :current_month
      t.integer :class_given

      t.timestamps
    end
  end
end
