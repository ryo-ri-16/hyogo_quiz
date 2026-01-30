class FixSolidCacheIndex < ActiveRecord::Migration[8.0]
  def change
    remove_index :solid_cache_entries,
                  name: "index_solid_cache_entries_unique",
                  if_exists: true
  end
end
