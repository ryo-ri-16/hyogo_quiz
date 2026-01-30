class FixSolidCacheIndex < ActiveRecord::Migration[8.0]
  def change
    # 余計な方を明示的に消す
    remove_index :solid_cache_entries, name: "index_solid_cache_entries_unique"

    # 正式名称で一本に統一
    add_index :solid_cache_entries,
              [ :key_hash, :shard ],
              unique: true,
              name: "index_solid_cache_entries_on_key_hash_and_shard"
  end
end
