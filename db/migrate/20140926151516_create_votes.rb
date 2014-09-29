class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :direction, null: false
      t.references :review, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
