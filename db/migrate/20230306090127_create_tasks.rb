class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :due_date
      t.boolean :completed, default: false
      t.references :user, foreign_key: true
      t.timestamps
  end
end

end
