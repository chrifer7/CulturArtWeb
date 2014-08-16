class CreateStoredProcedureFindByLatlon < ActiveRecord::Migration
  def up
    puts 'Create Find lat lon by distance'
    query = '
      CREATE OR REPLACE FUNCTION distance (Lat1 IN double precision,
                                     Lon1 IN double precision,
                                     Lat2 IN double precision,
                                     Lon2 IN double precision) RETURNS double precision AS $$

      DECLARE
      -- Convert degrees to radians
       DegToRad real := 0.01745329251994329576923690768489;--57.29577951;
       ERadius double precision := 6371;
      
       X double precision;
       Y double precision;
      
      BEGIN
        Lat1 := Lat1 * DegToRad;
        Lon1 := Lon1 * DegToRad;
        Lat2 := Lat2 * DegToRad;
        Lon2 := Lon2 * DegToRad;
         
        X := (Lon2 - Lon1)  * Cos((Lat1 + Lat2) / 2);
        Y := (Lat2 - Lat1);
      
        RETURN SQRT(X*X + Y*Y) * ERadius;
      END;
      $$ LANGUAGE plpgsql;'
      
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    puts 'Drop Find lat lon by distance'
    query = 'DROP FUNCTION distance;'      
    ActiveRecord::Base.connection.execute(query)
  end
end
