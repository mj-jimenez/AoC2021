rm(list = ls())
setwd("Day2/Input/")
library(dplyr)

# --- Data ---
moves <- read.table("input2.txt", sep = " ", header = FALSE, 
                    col.names = c("Move", "Units"))

# --- Code ---
# Make "up" values negative
moves <- moves %>% mutate(Units = if_else(Move == "up", -Units, Units))

# Horizontal position and depth
horizontal <- moves %>% filter(Move == "forward") %>% select(Units) %>% sum
depth <- moves %>% filter(Move != "forward") %>% select(Units) %>% sum

# Multiply both
horizontal * depth

# Correction (second problem)
aim <- moves %>% mutate(Units = replace(Units, Move == "forward", 0)) %>% 
  select(Units) %>% cumsum %>% pull
depth <- moves %>% mutate(Depth = Units * aim) %>% filter(Move == "forward") %>%
  select(Depth) %>% sum

horizontal * depth
