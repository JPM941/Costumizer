class RemoveCostumeReviewFromCostume < ActiveRecord::Migration[7.0]
  def change
    remove_column :costumes, :costume_review
  end
end
