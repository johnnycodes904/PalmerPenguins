install.packages('tidyverse')
library(tidyverse)

install.packages('palmerpenguins')
library('palmerpenguins')

data("penguins")
View(penguins)

# visualize body mass vs flipper length (do more massive birds have larger flippers?)
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species))

# visualize as above but jitter instead of point due to overlap and smooth for trendline and B&W for readability
ggplot(data = penguins) +
  geom_smooth(method = "gam", mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species)) +
  labs(title="Palmer Penguins Body Mass vs Flipper Length", subtitle="Measurements of Three Penguin Species")


# visualize body mass vs flipper length segmented by species
ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g)) +
  geom_point(aes(shape=species,color=species)) + 
  facet_wrap(~species) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length (Species)")

# visualize body mass vs flipper length segmented by island 
ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g)) +
  geom_point(aes(shape=species,color=island)) + 
  facet_wrap(~island) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length (Island)", subtitle="Segmented by Habitat Island")


# visualize body mass and island location (do bigger birds live on a particular island?)
ggplot(penguins, aes(x = island, y = body_mass_g, fill = island)) +
  geom_boxplot() +
  facet_wrap(~species) +
  labs(
    title = "Penguin Body Mass by Island",
    subtitle = "Mass by Habitat Island Segmented by Species",
    x = "Island",
    y = "Body Mass (g)")

# visualize body mass and flipper length and facet on species, include sex of penguins if known
ggplot(data=penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, color=sex)) +
  facet_grid(sex~species) +
  labs(title="Penguin Body Mass vs Flipper Length", subtitle="Segmented by Species and Sex",
       caption="Data collected by Dr. Kristen Gorman")