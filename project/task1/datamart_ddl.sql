create table analysis.dm_rfm_segments(
  user_id int NOT NULL,
  recency int NOT NULL CHECK (recency >=1 AND recency <=5),
  frequency int NOT NULL CHECK (frequency >=1 AND frequency <=5),
  monetary_value int NOT NULL CHECK (monetary_value >=1 AND monetary_value <=5),
constraint pk_dm_rfm_segments PRIMARY KEY (user_id));

