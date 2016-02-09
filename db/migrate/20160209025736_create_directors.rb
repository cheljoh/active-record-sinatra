class CreateDirectors < ActiveRecord::Migration
  
  def change
    create_table :directors do |t|
      t.string :title
    end
  end

end
