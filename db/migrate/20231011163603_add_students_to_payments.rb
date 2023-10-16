class AddStudentsToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :students, null: false, foreign_key: true
  end
end
