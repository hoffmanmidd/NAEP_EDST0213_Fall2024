# Koretz Chapter 5 Figures using API data from NAEP
# https://www.nationsreportcard.gov/api_documentation.aspx 

# The instructions below will help you to directly query the NAEP Data Service API 
# to acquire JSON of the same results available in the NAEP Data Explorer.

library(jsonlite)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(rvest)
library(ggthemes)

# Cycle through the "Main" NAEP data for 4th grade reading scores for 2022 - 1992

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2022R3"
readGr4_2022 <- data.frame(fromJSON(bridge))
readGr4_2022

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2019R3"
readGr4_2019 <- data.frame(fromJSON(bridge))
readGr4_2019

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2017R3"
readGr4_2017 <- data.frame(fromJSON(bridge))
readGr4_2017

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2015R3"
readGr4_2015 <- data.frame(fromJSON(bridge))
readGr4_2015

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2013R3"
readGr4_2013 <- data.frame(fromJSON(bridge))
readGr4_2013

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2011R3"
readGr4_2011 <- data.frame(fromJSON(bridge))
readGr4_2011

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2009R3"
readGr4_2009 <- data.frame(fromJSON(bridge))
readGr4_2009

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2007R3"
readGr4_2007 <- data.frame(fromJSON(bridge))
readGr4_2007

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2005R3"
readGr4_2005 <- data.frame(fromJSON(bridge))
readGr4_2005

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2003R3"
readGr4_2003 <- data.frame(fromJSON(bridge))
readGr4_2003

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2002R3"
readGr4_2002 <- data.frame(fromJSON(bridge))
readGr4_2002

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2000R3"
readGr4_2000 <- data.frame(fromJSON(bridge))
readGr4_2000

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1998R3"
readGr4_1998 <- data.frame(fromJSON(bridge))
readGr4_1998

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2000R2"
readGr4_2000R2 <- data.frame(fromJSON(bridge))
readGr4_2000R2

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1998R2"
readGr4_1998R2 <- data.frame(fromJSON(bridge))
readGr4_1998R2

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1994R2"
readGr4_1994R2 <- data.frame(fromJSON(bridge))
readGr4_1994R2

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=4&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1992R2"
readGr4_1992R2 <- data.frame(fromJSON(bridge))
readGr4_1992R2

# Append the dataframes together
readGr4 <- rbind(readGr4_2022, readGr4_2019, readGr4_2017, readGr4_2015, readGr4_2013, readGr4_2011, readGr4_2009, readGr4_2007, readGr4_2005, readGr4_2003, readGr4_2002, readGr4_2000, readGr4_1998, readGr4_2000R2, readGr4_1998R2, readGr4_1994R2, readGr4_1992R2)

# 5.4 Widening data
readGr4 <- readGr4 |> 
  pivot_wider(
    names_from = result.stattype,
    values_from = result.value
  )

# Keep the relevant columns
readGr4 <- readGr4  |> 
  select(result.year, result.sample, result.CohortLabel, result.subject, result.jurisdiction, result.jurisLabel, result.errorFlag, `MN:MN`, `SD:SD`) |>
  rename(average = `MN:MN`, standard_deviation = `SD:SD`, Year = result.year, Note = result.errorFlag)
readGr4

# Mutate to calculate the gain in standard deviations since 1992
readGr4 <- readGr4 |>
  mutate(GainReadGr4 = (average - average[Year == 1992])/standard_deviation[Year == 1992])

# Mutate to calculate the gain in standard deviations since 2002
readGr4 <- readGr4 |>
  mutate(Gain2002ReadGr4 = (average - average[Year == 2002])/standard_deviation[Year == 2002])

# Plot the data
ggplot(readGr4, aes(x = Year, y = average)) +
  geom_point() +
  geom_line(aes(group = Note), linewidth = 0.5) +
  scale_color_colorblind() 

# Plot the data in terms of standard deviations
ggplot(readGr4, aes(x = Year, y = GainReadGr4)) +
  geom_point() +
  geom_line(aes(group = Note), linewidth = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(breaks = seq(0, 0.9, by = 0.1)) 

# Plot the data in terms of standard deviations since 2002
ggplot(readGr4, aes(x = Year, y = Gain2002ReadGr4)) +
  geom_point() +
  geom_line(aes(group = Note), linewidth = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(breaks = seq(-1, 0.3, by = 0.1)) +
  geom_hline(yintercept = 0, linetype = "dotted") +
  geom_vline(xintercept = 2002, linetype = "dotted")


# Cycle through the "Main" NAEP data for 4th grade reading scores for 2022 - 1992

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2022R3"
readGr8_2022 <- data.frame(fromJSON(bridge))
readGr8_2022

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2019R3"
readGr8_2019 <- data.frame(fromJSON(bridge))
readGr8_2019

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2017R3"
readGr8_2017 <- data.frame(fromJSON(bridge))
readGr8_2017

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2015R3"
readGr8_2015 <- data.frame(fromJSON(bridge))
readGr8_2015

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2013R3"
readGr8_2013 <- data.frame(fromJSON(bridge))
readGr8_2013

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2011R3"
readGr8_2011 <- data.frame(fromJSON(bridge))
readGr8_2011

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2009R3"
readGr8_2009 <- data.frame(fromJSON(bridge))
readGr8_2009

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2007R3"
readGr8_2007 <- data.frame(fromJSON(bridge))
readGr8_2007

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2005R3"
readGr8_2005 <- data.frame(fromJSON(bridge))
readGr8_2005

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2003R3"
readGr8_2003 <- data.frame(fromJSON(bridge))
readGr8_2003

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=2002R3"
readGr8_2002 <- data.frame(fromJSON(bridge))
readGr8_2002

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1998R3"
readGr8_1998 <- data.frame(fromJSON(bridge))
readGr8_1998

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1998R2"
readGr8_1998R2 <- data.frame(fromJSON(bridge))
readGr8_1998R2

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1994R2"
readGr8_1994R2 <- data.frame(fromJSON(bridge))
readGr8_1994R2

bridge <- "https://www.nationsreportcard.gov/Dataservice/GetAdhocData.aspx?type=data&subject=reading&grade=8&subscale=RRPCM&variable=TOTAL&jurisdiction=NP&stattype=MN:MN,SD:SD&Year=1992R2"
readGr8_1992R2 <- data.frame(fromJSON(bridge))
readGr8_1992R2

# Append the dataframes together
readGr8 <- rbind(readGr8_2022, readGr8_2019, readGr8_2017, readGr8_2015, readGr8_2013, readGr8_2011, readGr8_2009, readGr8_2007, readGr8_2005, readGr8_2003, readGr8_2002, readGr8_1998, readGr8_1998R2, readGr8_1994R2, readGr8_1992R2)

# 5.4 Widening data
readGr8 <- readGr8 |> 
  pivot_wider(
    names_from = result.stattype,
    values_from = result.value
  )

# Keep the relevant columns
readGr8 <- readGr8  |> 
  select(result.year, result.sample, result.CohortLabel, result.subject, result.jurisdiction, result.jurisLabel, result.errorFlag, `MN:MN`, `SD:SD`) |>
  rename(average = `MN:MN`, standard_deviation = `SD:SD`, Year = result.year, Note = result.errorFlag)
readGr8

# Mutate to calculate the gain in standard deviations since 1992
readGr8 <- readGr8 |>
  mutate(GainReadGr8 = (average - average[Year == 1992])/standard_deviation[Year == 1992])

# Mutate to calculate the gain in standard deviations since 2002
readGr8 <- readGr8 |>
  mutate(Gain2002ReadGr8 = (average - average[Year == 2002])/standard_deviation[Year == 2002])

# Plot the data
ggplot(readGr8, aes(x = Year, y = average)) +
  geom_point() +
  geom_line(aes(group = Note), linewidth = 0.5) +
  scale_color_colorblind() 

# Plot the data in terms of standard deviations
ggplot(readGr8, aes(x = Year, y = GainReadGr8)) +
  geom_point() +
  geom_line(aes(group = Note), linewidth = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(breaks = seq(0, 0.9, by = 0.1)) 

# Plot the data in terms of standard deviations since 2002
ggplot(readGr8, aes(x = Year, y = Gain2002ReadGr8)) +
  geom_point() +
  geom_line(aes(group = Note), linewidth = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(breaks = seq(-1, 0.3, by = 0.1)) +
  geom_hline(yintercept = 0, linetype = "dotted") +
  geom_vline(xintercept = 2002, linetype = "dotted")
