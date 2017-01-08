class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.references :restaurant, foreign_key: true
      t.attachment :file

      t.timestamps
    end
  end
end
