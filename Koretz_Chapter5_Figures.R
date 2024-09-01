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
  mutate(GainMath4 = (`Average scale score` - `Average scale score`[Year == 1990])/`Standard deviation`[Year == 1990])

# Mutate to calculate the gain in standard deviations since 2003
MathGr4 <- MathGr4 |>
  mutate(Gain2003Math4 = (`Average scale score` - `Average scale score`[Year == 2003])/`Standard deviation`[Year == 2003])

# Plot the data
ggplot(MathGr4, aes(x = Year, y = `Average scale score`)) +
  geom_point() +
  geom_line(aes(group = Note), size = 0.5) +
  scale_color_colorblind() 

# Plot the data in terms of standard deviations
ggplot(MathGr4, aes(x = Year, y = GainMath4)) +
  geom_point() +
  geom_line(aes(group = Note), size = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(breaks = seq(0, 0.9, by = 0.1)) 

# Plot the data in terms of standard deviations since 2003
ggplot(MathGr4, aes(x = Year, y = Gain2003Math4)) +
  geom_point() +
  geom_line(aes(group = Note), size = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(breaks = seq(-1, 0.3, by = 0.1)) +
  geom_hline(yintercept = 0, linetype = "dotted") +
  geom_vline(xintercept = 2003, linetype = "dotted")

# Load the LTT data Math Age 9
LTT_Age9_OriginalFormat <- read_excel("NDECoreExcel_Long-Term Trend Mathematics, Age 9, All students -_20240827204534.xls", range = "A9:E18")
LTT_Age9_NewFormat <- read_excel("NDECoreExcel_Long-Term Trend Mathematics, Age 9, All students -_20240827204439.xls", range = "A9:E14")

# Add the format column
LTT_Age9_OriginalFormat$Note <- "Original format"
LTT_Age9_NewFormat$Note <- "New format"

# Combine the data
LTT_Age9 <- rbind(LTT_Age9_OriginalFormat, LTT_Age9_NewFormat)

# Mutate to calculate the gain in standard deviations since 1978
LTT_Age9 <- LTT_Age9 |>
  mutate(Gain = (`Average scale score` - `Average scale score`[Year == 1978])/`Standard deviation`[Year == 1978])

# Mutate to calculate the gain in standard deviations since 2003
# Interpolate the 2003 Average scale score
LTT_Age9_2003 <-239.3504 - .25*(242.8622 - 239.3504)

LTT_Age9 <- LTT_Age9 |>
  mutate(Gain2003Age9 = (`Average scale score` - LTT_Age9_2003)/`Standard deviation`[Year == 2004])


# Plot the data
ggplot(LTT_Age9, aes(x = Year, y = `Average scale score`)) +
  geom_point() +
  geom_line(aes(group = Note)) +
  scale_color_colorblind()

# Plot the data in terms of standard deviations
ggplot(LTT_Age9, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note)) +
  scale_color_colorblind() +
  scale_y_continuous(limits = c(0,0.9), breaks = seq(0, 0.9, by = 0.1)) 

# Combine the Elementary math data
ElementaryMath <- rbind(MathGr4, LTT_Age9)

# Plot the data in terms of standard deviations
ggplot(ElementaryMath, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note)) +
  scale_color_colorblind() +
  scale_y_continuous(limits = c(0,0.9), breaks = seq(0, 0.9, by = 0.1)) 

# Plot the data with dotted lines for Main NAEP and solid lines for LTT
LINES <- c("Original format" = "solid", "New format" = "solid", "Accommodations permitted" = "dashed", "Accommodations not permitted" = "dashed")
ggplot(ElementaryMath, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note, linetype = Note), show.legend = FALSE) +
  scale_color_colorblind() +
  scale_linetype_manual(values = LINES) +
  scale_y_continuous(limits = c(0, 0.9), breaks = seq(0, 0.9, by = 0.1)) +
  theme_minimal()

ggplot(ElementaryMath, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = Note, linetype = Note), show.legend = FALSE) +
  scale_color_colorblind() +
  scale_linetype_manual(values = c("Original format" = "solid", "New format" = "solid", "Accommodations permitted" = "dashed", "Accommodations not permitted" = "dashed")) +
  scale_y_continuous(breaks = seq(0, 0.9, by = 0.1)) +
  theme_minimal()

# Set the zero point to be 2003
ggplot(ElementaryMath, aes(x = Year, y = Gain2003)) +
  geom_point() +
  geom_line(aes(group = Note, linetype = Note), show.legend = FALSE) +
  scale_color_colorblind() +
  scale_linetype_manual(values = c("Original format" = "solid", "New format" = "solid", "Accommodations permitted" = "dashed", "Accommodations not permitted" = "dashed")) +
  scale_y_continuous(breaks = seq(-1, 0.4, by = 0.1)) +
  geom_hline(yintercept = 0, linetype = "dotted") +
  geom_vline(xintercept = 2003, linetype = "dotted") +
  theme_minimal() +
  # Add a note about the 2003 zero point
  annotate("text", x = 1990, y = .2, label = "Main NAEP in long dash; LTT in solid", size = 4)


#-------------------------------------
# Grade 8 and 13 year olds
# Load the data Math Grade 8 
MathGr8_Accom <- read_excel("NDECoreExcel_Mathematics, Grade 8, All students_20240830194211.xls", range = "A9:E21")
MathGr8_NoAccom <- read_excel("NDECoreExcel_Mathematics, Grade 8, All students - 2_20240830194528.xls", range = "A9:E13")

# Add the Accommodation column
MathGr8_Accom$NoteMS <- "Accommodations permitted"
MathGr8_NoAccom$NoteMS <- "Accommodations not permitted"

# Combine the data
MathGr8 <- rbind(MathGr8_Accom, MathGr8_NoAccom)

# Mutate to calculate the gain in standard deviations since 1990
MathGr8 <- MathGr8 |>
  mutate(Gain = (`Average scale score` - `Average scale score`[Year == 1990])/`Standard deviation`[Year == 1990])

# Mutate to calculate the gain in standard deviations since 2003
MathGr8 <- MathGr8 |>
  mutate(Gain2003 = (`Average scale score` - `Average scale score`[Year == 2003])/`Standard deviation`[Year == 2003])

# Plot the data
ggplot(MathGr8, aes(x = Year, y = `Average scale score`)) +
  geom_point() +
  geom_line(aes(group = NoteMS), size = 0.5) +
  scale_color_colorblind() 

# Plot the data in terms of standard deviations
ggplot(MathGr8, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = NoteMS), size = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(limits = c(0,0.9), breaks = seq(0, 0.9, by = 0.1)) 

# Plot the data in terms of standard deviations since 2003
ggplot(MathGr8, aes(x = Year, y = Gain2003)) +
  geom_point() +
  geom_line(aes(group = NoteMS), size = 0.5) +
  scale_color_colorblind() +
  scale_y_continuous(limits = c(-0.5,0.2), breaks = seq(-0.5, 0.2, by = 0.1)) +
  geom_hline(yintercept = 0, linetype = "dotted") +
  geom_vline(xintercept = 2003, linetype = "dotted")

# Load Data Math 13 year olds
LTT_Age13_NewFormat <- read_excel("NDECoreExcel_Long-Term Trend Mathematics, Age 13, All students _20240830190700.xls", range = "A9:E14")
LTT_Age13_OriginalFormat <- read_excel("NDECoreExcel_Long-Term Trend Mathematics, Age 13, All students _20240830191205.xls", range = "A9:E18")

# Add the format column
LTT_Age13_OriginalFormat$NoteMS <- "Original format"
LTT_Age13_NewFormat$NoteMS <- "New format"

# Combine the data
LTT_Age13 <- rbind(LTT_Age13_OriginalFormat, LTT_Age13_NewFormat)

# Mutate to calculate the gain in standard deviations since 1978
LTT_Age13 <- LTT_Age13 |>
  mutate(Gain = (`Average scale score` - `Average scale score`[Year == 1978])/`Standard deviation`[Year == 1978])

# Mutate to calculate the gain in standard deviations since 2003
# Interpolate the 2003 Average scale score
LTT_Age13_2003 <-278.7735 - .25*(281.45777 - 278.7735)

LTT_Age13 <- LTT_Age13 |>
  mutate(Gain2003 = (`Average scale score` - LTT_Age13_2003)/`Standard deviation`[Year == 2004])


# Plot the data
ggplot(LTT_Age13, aes(x = Year, y = `Average scale score`)) +
  geom_point() +
  geom_line(aes(group = NoteMS))  +
  scale_color_colorblind()

# Plot the data in terms of standard deviations
ggplot(LTT_Age13, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = NoteMS)) +
  scale_y_continuous(breaks = seq(0, 0.9, by = 0.1)) +
  scale_color_colorblind()


# Combine the Middle School math data
MiddleSchoolMath <- rbind(MathGr8, LTT_Age13)

ggplot(MiddleSchoolMath, aes(x = Year, y = Gain)) +
  geom_point() +
  geom_line(aes(group = NoteMS, linetype = NoteMS), show.legend = FALSE) +
  scale_linetype_manual(values = c("Original format" = "solid", "New format" = "solid", "Accommodations permitted" = "dashed", "Accommodations not permitted" = "dashed")) + 
  scale_color_colorblind() +
  scale_y_continuous(limits = c(0,0.9), breaks = seq(0, 0.9, by = 0.1)) 


# Set the zero point to be 2003
ggplot(MiddleSchoolMath, aes(x = Year, y = Gain2003)) +
  geom_point() +
  geom_line(aes(group = NoteMS, linetype = NoteMS), show.legend = FALSE) +
  scale_color_colorblind() +
  scale_linetype_manual(values = c("Original format" = "solid", "New format" = "solid", "Accommodations permitted" = "dashed", "Accommodations not permitted" = "dashed")) +
  scale_y_continuous(breaks = seq(-1, 0.4, by = 0.1)) +
  geom_hline(yintercept = 0, linetype = "dotted") +
  geom_vline(xintercept = 2003, linetype = "dotted") +
  theme_minimal() +
  # Add a note about the 2003 zero point
  annotate("text", x = 1990, y = .2, label = "Main NAEP in long dash; LTT in solid", size = 4)
