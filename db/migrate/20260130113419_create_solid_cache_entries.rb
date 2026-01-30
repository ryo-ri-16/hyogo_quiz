class CreateSolidCacheEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_cache_entries do |t|
      t.binary  :key_hash, null: false
      t.binary  :value
      t.datetime :expires_at
      t.integer :shard, null: false, default: 0

      t.timestamps
    end

    add_index :solid_cache_entries,
              [ :key_hash, :shard ],
              unique: true,
              name: "index_solid_cache_entries_unique"
  end
end
