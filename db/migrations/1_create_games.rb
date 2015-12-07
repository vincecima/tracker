Sequel.migration do
  up do
    create_table(:games) do
      primary_key :id
      String :title, null: false
      String :platform, null: false
      String :service
      Boolean :owned, default: false
      Json :notes
    end

    run <<-SQL
      ALTER TABLE games
      ADD CONSTRAINT platform_values
      CHECK (platform IN (
          '3DS', 'GCN', 'GBA', 'GBC', 'GEN', 'iOS', 'NB4', 'NGPC', 'PS1',
          'PS2', 'PS3', 'PS4', 'PSP', 'SAT', 'SCD', 'SNES', 'VITA', 'Wii',
          'X360', 'XONE'
      ))
    SQL
  end

  down do
    drop_table(:games)
  end
end
