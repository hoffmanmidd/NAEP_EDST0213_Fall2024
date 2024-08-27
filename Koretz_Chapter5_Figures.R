# Chapter 5 in Measuring Up, by Daniel Koretz
library(tidyverse)
library(readxl)
library(ggthemes)

# Load the data Math Grade 4 
MathGr4_Accom <- read_excel("NDECoreExcel_Mathematics, Grade 4, All students_20240827192140.Xls", range = "A9:E21")
MathGr4_NoAccom <- read_excel("NDECoreExcel_Mathematics, Grade 4, All students - 2_20240827192143.Xls", range = "A9:E13")

# Add the Accommodation column
MathGr4_Accom$Note <- "Accommodations permitted"
MathGr4_NoAccom$Note <- "Accommodations not permitted"

# Combine the data
MathGr4 <- rbind(MathGr4_Accom, MathGr4_NoAccom)

# Mutate to calculate the gain in standard deviations since 1990
MathGr4 <- MathGr4 |>
  mutate(Gain = (`Average scale score` - `Average scale score`[Year == 1990])/`Standard deviation`[Year == 1990])

# Plot the data
ggplot(MathGr4, aes(x = Year, y = `Average scale score`)) +
  geom_point() +
  geom_line(aes(group = Note), size = 0.5) +
  scale_color_colorblind() 

# Plot the data in terms of standard deviations
ggplot(MathGr4, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note), size = 0.5) +
  scale_color_colorblind()

# Load the LTT data Math Age 9
LTT_Age9_OldFormat <- read_excel("NDECoreExcel_Long-Term Trend Mathematics, Age 9, All students -_20240827204534.xls", range = "A9:E18")
LTT_Age9_NewFormat <- read_excel("NDECoreExcel_Long-Term Trend Mathematics, Age 9, All students -_20240827204439.xls", range = "A9:E14")

# Add the format column
LTT_Age9_OldFormat$Note <- "Old format"
LTT_Age9_NewFormat$Note <- "New format"

# Combine the data
LTT_Age9 <- rbind(LTT_Age9_OldFormat, LTT_Age9_NewFormat)

# Mutate to calculate the gain in standard deviations since 1978
LTT_Age9 <- LTT_Age9 |>
  mutate(Gain = (`Average scale score` - `Average scale score`[Year == 1978])/`Standard deviation`[Year == 1978])


# Plot the data
ggplot(LTT_Age9, aes(x = Year, y = `Average scale score`)) +
  geom_point() +
  geom_line(aes(group = Note)) +
  scale_color_colorblind()

# Plot the data in terms of standard deviations
ggplot(LTT_Age9, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note)) +
  scale_color_colorblind()

# Combine the Elementary math data
ElementaryMath <- rbind(MathGr4, LTT_Age9)

# Plot the data in terms of standard deviations
ggplot(ElementaryMath, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note)) +
  scale_color_colorblind()

# Plot the data with dotted lines for Main NAEP and solid lines for LTT
ggplot(ElementaryMath, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note, linetype = Note)) +
  scale_color_colorblind() 
  
