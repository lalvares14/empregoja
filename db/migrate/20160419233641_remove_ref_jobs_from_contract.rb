class RemoveRefJobsFromContract < ActiveRecord::Migration
  def change
    remove_reference :contracts, :job, index: true, foreign_key: true
  end
end
