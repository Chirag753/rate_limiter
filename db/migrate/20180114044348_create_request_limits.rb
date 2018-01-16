class CreateRequestLimits < ActiveRecord::Migration
  def change
    create_table :request_limits do |t|
      t.string :ip

      t.timestamps null: false
    end
  end
end
