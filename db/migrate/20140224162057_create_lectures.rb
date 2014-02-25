class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.string :name
      t.string :code
      t.date :semester
      t.string :professor
      t.float :score
      t.float :gpa
      t.float :hard

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end
