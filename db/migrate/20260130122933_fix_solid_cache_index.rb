class FixSolidCacheIndex < ActiveRecord::Migration[8.0]
  def change
    remove_index :solid_cache_entries, column: [ :key_hash, :shard ]
    add_index :solid_cache_entries,
              [ :key_hash, :shard ],
              unique: true,
              name: "index_solid_cache_entries_on_key_hash_and_shard"
  end
end
