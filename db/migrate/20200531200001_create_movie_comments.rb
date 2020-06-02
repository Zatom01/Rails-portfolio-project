class CreateMovieComments < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_comments do |t|
      t.string :username
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
