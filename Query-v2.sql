# INTRODUCTION

# 1. Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. (This has to be done for all 6 stocks)
# 2. Create a master table containing the date and close price of all the six stocks. (Column header for the price is the name of the stock)
# 3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. Perform this operation for all stocks.
# 4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.

-- Selecting the database Assignment
use assignment;

########################################### Bajaj ######################################################

# formatting date column
UPDATE bajaj_auto
SET `Date` = STR_TO_DATE(`Date`,'%d-%M-%Y');

# Date column type convertion to date from string
alter table bajaj_auto modify column `Date` date;

# Creating bajaj1 table containing the date, close price, 20 Day MA and 50 Day MA
drop table if exists bajaj1;

create table bajaj1 as
(select `Date`,`Close Price`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 20 THEN 
		avg(`Close Price`) over(order by Date ROWS 20 PRECEDING) 
	ELSE NULL 
END AS `20 Day MA`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 50 THEN 
		avg(`Close Price`) over(order by Date ROWS 50 PRECEDING) 
	ELSE NULL 
END AS `50 Day MA`
from bajaj_auto
window w as (ORDER BY DATE));

# Creating bajaj2 table to generate buy and sell signal.
drop table if exists bajaj2;

create table bajaj2 as
(select Date, `Close Price`, 
CASE 
	WHEN `20 Day MA`>`50 Day MA` then 'BUY'
    WHEN `20 Day MA`<`50 Day MA` then 'SELL'
    ELSE 'HOLD'
END AS `Signal` 
from bajaj1);

################################################ Eicher ####################################################

# formatting date column 
UPDATE eicher_motor
SET `Date` = STR_TO_DATE(`Date`,'%d-%M-%Y');

# Date column type convertion to date from string
alter table eicher_motor modify column `date` date;

# Creating eicher1 table containing the date, close price, 20 Day MA and 50 Day MA
drop table if exists eicher1;

create table eicher1 as
(select `Date`,`Close Price`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 20 THEN 
		avg(`Close Price`) over(order by Date ROWS 20 PRECEDING) 
	ELSE NULL 
END AS `20 Day MA`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 50 THEN 
		avg(`Close Price`) over(order by Date ROWS 50 PRECEDING) 
	ELSE NULL 
END AS `50 Day MA`
from eicher_motor
window w as (ORDER BY DATE));

# Creating eicher2 table to generate buy and sell signal.
drop table if exists eicher2;

create table eicher2 as
(select Date, `Close Price`, 
CASE 
	WHEN `20 Day MA`>`50 Day MA` then 'BUY'
    WHEN `20 Day MA`<`50 Day MA` then 'SELL'
    ELSE 'HOLD'
END AS `Signal` 
from eicher1);

############################################## Hero Motocorp ################################################

# formatting date column 
UPDATE `hero_motocorp` SET `Date` = STR_TO_DATE(`Date`,'%d-%M-%Y');

# Date column type convertion to date from string
alter table hero_motocorp modify column `date` date;

# Creating hero1 table containing the date, close price, 20 Day MA and 50 Day MA
drop table if exists hero1;

create table hero1 as
(select `Date`,`Close Price`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 20 THEN 
		avg(`Close Price`) over(order by Date ROWS 20 PRECEDING) 
	ELSE NULL 
END AS `20 Day MA`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 50 THEN 
		avg(`Close Price`) over(order by Date ROWS 50 PRECEDING) 
	ELSE NULL 
END AS `50 Day MA`
from hero_motocorp
window w as (ORDER BY DATE));

# Creating hero2 table to generate buy and sell signal.

drop table if exists hero2;

create table hero2 as
(select Date, `Close Price`, 
CASE 
	WHEN `20 Day MA`>`50 Day MA` then 'BUY'
    WHEN `20 Day MA`<`50 Day MA` then 'SELL'
    ELSE 'HOLD'
END AS `Signal` 
from hero1);

############################################### Infosys ###############################################

# formatting date column
UPDATE `infosys` SET `Date` = STR_TO_DATE(`Date`,'%d-%M-%Y');

# Date column type convertion to date from string
alter table infosys modify column `Date` date;

# Creating infosys1 table containing the date, close price, 20 Day MA and 50 Day MA
drop table if exists infosys1;

create table infosys1 as
(select `Date`,`Close Price`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 20 THEN 
		avg(`Close Price`) over(order by Date ROWS 20 PRECEDING) 
	ELSE NULL 
END AS `20 Day MA`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 50 THEN 
		avg(`Close Price`) over(order by Date ROWS 50 PRECEDING) 
	ELSE NULL 
END AS `50 Day MA`
from infosys
window w as (ORDER BY DATE));

# Creating infosys2 table to generate buy and sell signal.

drop table if exists infosys2;

create table infosys2 as
(select Date, `Close Price`, 
CASE 
	WHEN `20 Day MA`>`50 Day MA` then 'BUY'
    WHEN `20 Day MA`<`50 Day MA` then 'SELL'
    ELSE 'HOLD'
END AS `Signal` 
from infosys1);

####################################################### TCS #######################################################

# formatting date column
UPDATE `tcs` SET `Date` = STR_TO_DATE(`Date`,'%d-%M-%Y');

# Date column type convertion to date from string
alter table tcs modify column `date` date;

# Creating tcs1 table containing the date, close price, 20 Day MA and 50 Day MA
drop table if exists tcs1;

create table tcs1 as
(select `Date`,`Close Price`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 20 THEN 
		avg(`Close Price`) over(order by Date ROWS 20 PRECEDING) 
	ELSE NULL 
END AS `20 Day MA`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 50 THEN 
		avg(`Close Price`) over(order by Date ROWS 50 PRECEDING) 
	ELSE NULL 
END AS `50 Day MA`
from tcs
window w as (ORDER BY DATE));

# Creating tcs2 table to generate buy and sell signal.

drop table if exists tcs2;

create table tcs2 as
(select Date, `Close Price`, 
CASE 
	WHEN `20 Day MA`>`50 Day MA` then 'BUY'
    WHEN `20 Day MA`<`50 Day MA` then 'SELL'
    ELSE 'HOLD'
END AS `Signal` 
from tcs1);

############################################################ TVS #####################################################

# formatting date column
UPDATE `tvs` SET `Date` = STR_TO_DATE(`Date`,'%d-%M-%Y');

# Date column type convertion to date from string
alter table tvs modify column `date` date;

# Creating tvs1 table containing the date, close price, 20 Day MA and 50 Day MA
drop table if exists tvs1;

create table tvs1 as
(select `Date`,`Close Price`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 20 THEN 
		avg(`Close Price`) over(order by Date ROWS 20 PRECEDING) 
	ELSE NULL 
END AS `20 Day MA`,
CASE WHEN 
	ROW_NUMBER() OVER w >= 50 THEN 
		avg(`Close Price`) over(order by Date ROWS 50 PRECEDING) 
	ELSE NULL 
END AS `50 Day MA`
from tvs
window w as (ORDER BY DATE));

# Creating tvs2 table to generate buy and sell signal.
drop table if exists tvs2;

create table tvs2 as
(select Date, `Close Price`, 
CASE 
	WHEN `20 Day MA`>`50 Day MA` then 'BUY'
    WHEN `20 Day MA`<`50 Day MA` then 'SELL'
    ELSE 'HOLD'
END AS `Signal` 
from tvs1);


## Creating Master table containing the date and close price of all the six stocks.
drop table if exists master;

create table master as 
(select b.date Date, 
b.`close price` Bajaj, 
tc.`close price` TCS, 
tv.`close price` TVS, 
i.`close price` Infosys,
e.`close price` Eicher,
h.`close price` Hero 
from bajaj1 b inner join tcs1 tc 
	on b.date = tc.date
inner join tvs1 tv 
	on tc.date = tv.date
inner join infosys1 i 
	on i.date = tv.date
inner join eicher1 e 
	on e.date = i.date
inner join hero1 h
	on h.date = e.date
);


# User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.
DROP Function IF EXISTS BajajStock;

CREATE FUNCTION BajajStock(d date)
returns char(4) deterministic
return (select `Signal` from bajaj2 where date=d);

# User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Eicher stock.
DROP Function IF EXISTS EicherStock;

CREATE FUNCTION EicherStock(d date)
returns char(4) deterministic
return (select `Signal` from eicher2 where date=d);

# User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Hero stock.
DROP Function IF EXISTS HeroStock;

CREATE FUNCTION HeroStock(d date)
returns char(4) deterministic
return (select `Signal` from hero2 where date=d);

# User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Infosys stock.
DROP Function IF EXISTS InfosysStock;

CREATE FUNCTION InfosysStock(d date)
returns char(4) deterministic
return (select `Signal` from infosys2 where date=d);

# User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the TCS stock.
DROP Function IF EXISTS TCSStock;

CREATE FUNCTION TCSStock(d date)
returns char(4) deterministic
return (select `Signal` from tcs2 where date=d);

# User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the TVS stock.
DROP Function IF EXISTS TVSStock;

CREATE FUNCTION TVSStock(d date)
returns char(4) deterministic
return (select `Signal` from tvs2 where date=d);

