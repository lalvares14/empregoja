class AddCompanyIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :company_id, index: true, foreign_key: true
  end
end
