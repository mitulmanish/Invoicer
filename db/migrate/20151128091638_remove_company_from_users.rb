class RemoveCompanyFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :company_id
  end
end
