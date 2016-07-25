class AddJoinTable < ActiveRecord::Migration
  def change
    create_join_table :images, :films do |t|
      # t.index [:image_id, :film_id]
      # t.index [:film_id, :image_id]
    end
  end
end
