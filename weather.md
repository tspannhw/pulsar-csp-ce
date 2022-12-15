

````
CREATE TABLE airportweather (
`dewpoint_c` DOUBLE,                      
`dewpoint_f` DOUBLE,                      
`dewpoint_string` STRING,                       
`heat_index_c` INT,                      
`heat_index_f` INT,                      
`heat_index_string` STRING,                       
`icon_url_base` STRING,                       
`icon_url_name` STRING,                       
`latitude` DOUBLE,                      
`location` STRING,                       
`longitude` DOUBLE,                      
`ob_url` STRING,                       
`observation_time` STRING,                       
`observation_time_rfc822` STRING,                       
`pressure_in` DOUBLE,                      
`pressure_mb` DOUBLE,                      
`pressure_string` STRING,                       
`relative_humidity` INT,                      
`station_id` STRING,                       
`temp_c` DOUBLE,                      
`temp_f` DOUBLE,                      
`temperature_string` STRING,   
`ts` DOUBLE,
`two_day_history_url` STRING,                       
`visibility_mi` DOUBLE,                      
`weather` STRING,                       
`wind_degrees` INT,                      
`wind_dir` STRING,                       
`wind_kt` INT,                      
`wind_mph` DOUBLE,                      
`wind_string` STRING
) WITH (
  'admin-url' = 'http://192.168.101.219:8080',
  'scan.startup.mode' = 'earliest',
  'service-url' = 'pulsar://192.168.101.219:6650',
  'generic' = 'true',
  'connector' = 'pulsar',
  'value.format' = 'json',
  'topic' = 'persistent://public/default/aircraftweather2'
);


CREATE TABLE `ssb`.`ssb_default`.`pulsar_citibikenyc2` (
  `num_docks_disabled` DOUBLE,
  `eightd_has_available_keys` VARCHAR(2147483647),
  `station_status` VARCHAR(2147483647),
  `last_reported` DOUBLE,
  `is_installed` DOUBLE,
  `num_ebikes_available` DOUBLE,
  `num_bikes_available` DOUBLE,
  `station_id` DOUBLE,
  `is_renting` DOUBLE,
  `is_returning` DOUBLE,
  `num_docks_available` DOUBLE,
  `num_bikes_disabled` DOUBLE,
  `legacy_id` DOUBLE,
  `valet` VARCHAR(2147483647),
  `eightd_active_station_services` VARCHAR(2147483647),
  `ts` DOUBLE,
  `uuid` VARCHAR(2147483647)
) WITH (
  'admin-url' = 'http://192.168.101.219:8080',
  'scan.startup.mode' = 'earliest',
  'service-url' = 'pulsar://192.168.101.219:6650',
  'generic' = 'true',
  'connector' = 'pulsar',
  'value.format' = 'json',
  'topic' = 'persistent://public/default/citibikenyc'
)

````
