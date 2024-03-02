-- This query lists with bike station names starting with an 'A' and an 'E' 
SELECT
    ARRAY_CONCAT (
        (
            -- Selects names that start with an 'A'
            SELECT
                ARRAY_AGG (name)
            FROM
                (
                    SELECT
                        name
                    FROM
                        `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info`
                    WHERE
                        name LIKE 'A%'
                )
        ),
        (
            -- Selects names that start with an 'E'
            SELECT
                ARRAY_AGG (name)
            FROM
                (
                    SELECT
                        name
                    FROM
                        `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info`
                    WHERE
                        name LIKE 'E%'
                )
        )
    ) AS name