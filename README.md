### pulsar-csp-ce

Cloudera CSP CE Plus Apache Pulsar


### Integration

* https://community.cloudera.com/t5/Cloudera-Stream-Processing-Forum/Using-Apache-Pulsar-with-SQL-Stream-Builder/m-p/349917


### Once running in docker

http://localhost:18121/ui/login

### Login

admin/admin

### SQL Testing

````

CREATE TABLE pulsar_test (
  `city` STRING
) WITH (
  'connector' = 'pulsar',
  'topic' = 'topic82547611',
  'value.format' = 'raw',
  'service-url' = 'pulsar://Timothys-MBP:6650',
  'admin-url' = 'http://Timothys-MBP:8080',
  'scan.startup.mode' = 'earliest',
  'generic' = 'true'
);

CREATE TABLE  `pulsar_table_1670269295` (
  `col_str` STRING,
  `col_int` INT,
  `col_ts` TIMESTAMP(3),
   WATERMARK FOR `col_ts` AS col_ts - INTERVAL '5' SECOND
) WITH (
  'format' = 'json' -- Data format
  -- 'json.encode.decimal-as-plain-number' = 'false' -- Optional flag to specify whether to encode all decimals as plain numbers instead of possible scientific notations, false by default.
  -- 'json.fail-on-missing-field' = 'false' -- Optional flag to specify whether to fail if a field is missing or not, false by default.
  -- 'json.ignore-parse-errors' = 'false' -- Optional flag to skip fields and rows with parse errors instead of failing; fields are set to null in case of errors, false by default.
  -- 'json.map-null-key.literal' = 'null' -- Optional flag to specify string literal for null keys when 'map-null-key.mode' is LITERAL, \"null\" by default.
  -- 'json.map-null-key.mode' = 'FAIL' -- Optional flag to control the handling mode when serializing null key for map data, FAIL by default. Option DROP will drop null key entries for map data. Option LITERAL will use 'map-null-key.literal' as key literal.
  -- 'json.timestamp-format.standard' = 'SQL' -- Optional flag to specify timestamp format, SQL by default. Option ISO-8601 will parse input timestamp in \"yyyy-MM-ddTHH:mm:ss.s{precision}\" format and output timestamp in the same format. Option SQL will parse input timestamp in \"yyyy-MM-dd HH:mm:ss.s{precision}\" format and output timestamp in the same format.
);


CREATE TABLE pulsar_citibikenyc (
	`num_docks_disabled` DOUBLE,
	`eightd_has_available_keys` STRING,
	`station_status` STRING,
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
	`valet` STRING,
	`eightd_active_station_services` STRING,
	`ts` DOUBLE,
	`uuid` STRING
) WITH (
  'connector' = 'pulsar',
  'topic' = 'persistent://public/default/citibikenyc',
  'value.format' = 'json',
  'service-url' = 'pulsar://Timothys-MBP:6650',
  'admin-url' = 'http://Timothys-MBP:8080',
  'scan.startup.mode' = 'earliest',
  'generic' = 'true'
);

CREATE TABLE pulsar_thermalsensors (
  `uuid` STRING NOT NULL,
  `ipaddress` STRING NOT NULL,
  `cputempf` INT NOT NULL,
  `runtime` INT NOT NULL,
  `host` STRING NOT NULL,
  `hostname` STRING NOT NULL,
  `macaddress` STRING NOT NULL,
  `endtime` STRING NOT NULL,
  `te` STRING NOT NULL,
  `cpu` FLOAT NOT NULL,
  `diskusage` STRING NOT NULL,
  `memory` FLOAT NOT NULL,
  `rowid` STRING NOT NULL,
  `systemtime` STRING NOT NULL,
  `ts` INT NOT NULL,
  `starttime` STRING NOT NULL,
  `datetimestamp` STRING NOT NULL,
  `temperature` FLOAT NOT NULL,
  `humidity` FLOAT NOT NULL,
  `co2` FLOAT NOT NULL,
  `totalvocppb` FLOAT NOT NULL,
  `equivalentco2ppm` FLOAT NOT NULL,
  `pressure` FLOAT NOT NULL,
  `temperatureicp` FLOAT NOT NULL
) WITH (

  'connector' = 'pulsar',
  'topic' = 'persistent://public/default/thermalsensors',
  'value.format' = 'json',
  'service-url' = 'pulsar://Timothys-MBP:6650',
  'admin-url' = 'http://Timothys-MBP:8080',
  'scan.startup.mode' = 'earliest',
  'generic' = 'true'
)


CREATE TABLE  fake_data (
city STRING )
WITH (
'connector' = 'faker',
'rows-per-second' = '1',
'fields.city.expression' = '#{Address.city}'
);

insert into pulsar_test
select * from fake_data;


select last_reported, num_bikes_available, station_id, num_docks_available, ts
from 
pulsar_citibikenyc;


````
### References

* https://github.com/tspannhw/create-nifi-pulsar-flink-apps
* https://github.com/streamnative/flink-example/blob/main/docker-compose.yml
* https://docs.cloudera.com/csp-ce/latest/index.html


### Meetup

https://www.meetup.com/new-york-city-apache-pulsar-meetup/events/289674210/


Details
For non-locals, we will Broadcast Live via Youtube. Sign up and we will send out the link.

Location:

TigerLabs in Princeton on the 2nd floor, walk up and the door will be open. Same that we were using for the old Future of Data - Princeton events 2016-2019.

Parking at the school is free. street parking nearby is free. there are meters on some streets and a few blocks away is a paid parking garage.

We are joining forces with our friends Cloudera again on a FLiPN amazing journey into Real-Time Streaming Applications with Apache Flink, Apache NiFi, and Apache Pulsar.

Discover how to stream data to and from your data lake or data mart using Apache Pulsar™ and Apache NiFi®. Learn how these cloud-native, scalable open-source projects built for streaming data pipelines work together to enable you to quickly build applications with minimal coding.

|WHAT THE SESSION WILL COVER|

Apache NiFi
Apache Pulsar
Apache Flink
Flink SQL
We will show you how to build apps, so download beforehand to Docker, K8, your Laptop, or the cloud.

Cloudera CSP Setup
Getting Started with Cloudera Stream Processing Community Edition
You may download CSP-CE here:
Cloudera Stream Processing Community Edition
The Cloudera CDP User's page:
CDP Resources Page

https://youtu.be/s80sz3NWwHo
https://docs.cloudera.com/csp-ce/latest/index.html
https://www.cloudera.com/downloads/cdf/csp-community-edition.html

Apache Pulsar
https://pulsar.apache.org/docs/getting-started-standalone/
or
https://streamnative.io/free-cloud/

Cloudera + Pulsar
https://community.cloudera.com/t5/Cloudera-Stream-Processing-Forum/Using-Apache-Pulsar-with-SQL-Stream-Builder/m-p/349917

https://community.cloudera.com/t5/Community-Articles/Using-Apache-NiFi-with-Apache-Pulsar-for-Streaming/ta-p/337891
|AGENDA|
6:00 - 6:30 PM EST: Food, Drink, and Networking!!!

6:30 - 7:15 PM EST: Presentation - Tim Spann, StreamNative Developer Advocate

7:15 - 8:00 PM EST: Presentation - John Kuchmek, Cloudera Principal Solutions Engineer

8:00 - 8:30 PM EST: Round Table on Real-Time Streaming

8:30 - 9:00 PM EST: Q&A + Networking

|ABOUT THE SPEAKERS|

John Kuchmek is a Principal Solutions Engineer for Cloudera. Before joining Cloudera, John transitioned to the Autonomous Intelligence team where he was in charge of integrating the platforms to allow data scientists to work with various types of data.

Tim Spann is a Developer Advocate for StreamNative. He works with StreamNative Cloud, Apache Pulsar™, Apache Flink®, Flink® SQL, Big Data, the IoT, machine learning, and deep learning. Tim has over a decade of experience with the IoT, big data, distributed computing, messaging, streaming technologies, and Java programming.

See:
https://www.meetup.com/new-york-city-apache-pulsar-meetup/events/283837865/
https://github.com/tspannhw/SpeakerProfile
https://www.meetup.com/futureofdata-newyork/
https://github.com/tspannhw/pulsar-transit-function
https://www.meetup.com/futureofdata-princeton/

Join us Dec. 5-8 for our new #ApachePulsar #appdev course! The blended learning class includes self-paced & hands-on lab exercises with office hours. Designed for app and #ETL #Developers, #DataArchitects, & #DataScientists. Space is limited! Learn more: http://bit.ly/SNdevcourse
