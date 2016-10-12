class AddVoteCountToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :vote_total, :integer, default: 0
  end
end
