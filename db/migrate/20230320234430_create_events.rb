class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :descrition

      t.timestamps
    end
  end
end
