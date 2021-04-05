class EnablePgExtensions < ActiveRecord::Migration[6.1]
  def change
    enable_extension "hstore"
    enable_extension "plpgsql"
    enable_extension "uuid-ossp"
  end
end
