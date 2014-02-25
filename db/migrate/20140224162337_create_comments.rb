class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.float :score
      t.float :gpa
      t.float :hard
      t.references :lecture

      t.timestamps
    end

    add_index :comments, :lecture_id
  end

  def self.down
    drop_table :comments
  end
end
