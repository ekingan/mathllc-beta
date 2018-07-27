class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :client, foreign_key: true
      t.integer :job_type
      t.integer :status

      t.timestamps
    end
  end
end
