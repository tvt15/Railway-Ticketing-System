class AddKeysToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :passenger, null: false, foreign_key: true
    add_reference :reviews, :train, null: false, foreign_key: true
    add_reference :reviews, :admin, null: false, foreign_key: true
  end
end
