class CreateTeachingAssistants < ActiveRecord::Migration
  def change
    create_table :teaching_assistants do |t|
      t.string :name
      t.integer :ta_duty_id
      t.string :ta_duty_type

      t.timestamps
    end
  end	
end
