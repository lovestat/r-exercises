library(dbplyr)
library(dplyr)

con <- DBI::dbConnect(RSQLite::SQLite(), dbname = ":memory:")
copy_to(con, df = nycflights13::airports, "airports")
DBI::dbListTables(con)
#> [1] "airports"     "sqlite_stat1" "sqlite_stat4"
airports_db <- tbl(con, "airports")

airports_db

airport_timezone <- airports_db %>%
  group_by(tzone) %>%
  summarise(count = n())
airport_timezone



airport_timezone %>%
  show_query()

airport_car <- airports_db %>%
  filter(lat >= 33.7666, lat <= 36.588, lon >= -84.3201, lon <= -75.4129) %>%
  arrange(desc(alt)) %>%
  select(name, alt)

airport_car %>%
  show_query()

?collect
install.packages("Lahman")

format(1:10)
format(1:10, trim = TRUE)
library(RSQLite)
library(Lahman)
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbWriteTable(con, "batting", Batting)
dbWriteTable(con, "pitching", Pitching)
dbWriteTable(con, "teams", Teams)


dbListTables(con)
dbli





















install.packages("sf")
library(sf)
nc <- st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
nc
plot(nc)



mapview(nc)

durham_county <- nc %>%
  filter(NAME == "Durham")

durham_county %>% DT::datatable()

durham_county %>% str()

nc[durham_county, ] %>% str()
nc[durham_county, ] %>% DT::datatable()



df <- data.frame(x = 1:10, y = letters[1:10])
df.x <- data.frame(x = 1:5, y = letters[1:5])
df[df.x, ]



x <- 1:2
x[1:4]


install.packages("assertthat")
library(assertthat)
ls("package:assertthat")

apropos(where = assert_that)
library(testthat)

?source
?auto_test
install.packages("sparklyr")

library(sparklyr)
sparklyr::spark_available_versions()
sparklyr::spark_available_versions()
spark_install(version = "3.0")
# add some custom configurations
conf <- list(
  sparklyr.cores.local = 4,
  `sparklyr.shell.driver-memory` = "16G",
  spark.memory.fraction = 0.5
)


# create a spark connection
sc <- spark_connect(master = "local",
                    version = "3.0.0"
                    )
