class CreateWordings < ActiveRecord::Migration[7.0]
  def change
    create_table :wordings do |t|
      t.text :text
      t.string :level
      t.string :author

      t.timestamps
    end
  end
end
