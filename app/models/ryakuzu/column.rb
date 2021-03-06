module Ryakuzu
  class Column < Schema
    attr_accessor :hash, :table, :column, :default, :type, :null, :index

    def initialize(hash = {})
      @hash     = hash
      @table    = hash[:table]
      @column   = hash[:column]
      @default  = hash[:default]
      @type     = hash[:type]
      @null     = hash[:null]
    end

    def column_info
      @null = to_boolean(null)
      Ryakuzu::ColumnDefaults.new(hash, null)
    end

    private

    def to_boolean(str)
      str == 'true'
    end

=begin
    def check_index
      @index = index.split
      index_hash = create_hash(@index)
      h2 = hash.reject! { |_k, v| v.nil? }
      (index_hash && h2) ? (index_hash.keys.first == h2[:table] && index_hash.values.first == h2[:column]) : (false)
    end

    def create_hash(hash_i)
      indx = hash_i.each_with_object(Hash.new(0)) { |i, hash| hash[i] = i }
      new_hash = {}
      new_hash[indx.keys.first[0]] = indx.keys.first[1].delete!('[').delete!(']')
      new_hash
    end
=end
  end
end
