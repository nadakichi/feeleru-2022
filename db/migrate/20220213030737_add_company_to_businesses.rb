class AddCompanyToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :company, :string, null: false
  end
end
