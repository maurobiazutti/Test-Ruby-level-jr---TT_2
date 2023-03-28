class CreateUserEventAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :user_event_awards do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :award, null: true, foreign_key: true

      t.timestamps
    end
  end
end
