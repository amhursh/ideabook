class AddIdeaImageToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :idea_image, foreign_key: true, index: true
  end
end
