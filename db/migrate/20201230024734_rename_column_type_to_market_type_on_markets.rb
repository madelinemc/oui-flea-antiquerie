class RenameColumnTypeToMarketTypeOnMarkets < ActiveRecord::Migration[6.0]
  def change
    rename_column :markets, :type, :market_type
  end
end
