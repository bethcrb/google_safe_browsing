require 'rails/generators/migration'

module GoogleSafeBrowsing
  module Generators
    class ChunkGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_model_file
        template 'chunk.rb', 'app/models/chunk.rb'
        migration_template 'create_chunks', "db/migrate/create_chunks"
      end
    end
  end
end
