penguins %>% 
  arrange(-bill_length_mm)

# create new data frame arranged by bill length, descending (in mm)
penguins2 <- penguins %>% arrange(-bill_length_mm)
view(penguins2)

# create data frame of mean bill length by island
penguins %>% 
  group_by(island) %>% 
  drop_na() %>% summarize(mean_bill_length_mm = mean(bill_length_mm))

# create data frame of max bill length of penguins by island
penguins %>% 
  group_by(island) %>% drop_na() %>% summarize(max_bill_length_mm = max(bill_length_mm))

# create data frame with max and mean bill lengths, by island
penguins %>% 
  group_by(species, island) %>%  drop_na() %>% summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

# create data frame of only Adelie species penguins
penguins %>% filter(species == "Adelie")