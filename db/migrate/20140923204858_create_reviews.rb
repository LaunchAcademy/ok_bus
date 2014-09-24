class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, null: false
      t.references :ride, index: true, null: false
      t.string :rating, null: false
      t.text :body

      t.timestamps
    end
  end
end
