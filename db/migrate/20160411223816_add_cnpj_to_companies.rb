class AddCnpjToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :cnpj, :string
  end
end
