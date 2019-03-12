class CreateAssignedProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :assigned_projects do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :project_id, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
