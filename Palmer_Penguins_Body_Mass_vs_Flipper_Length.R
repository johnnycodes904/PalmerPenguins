install.packages('tidyverse')
library(tidyverse)

install.packages('palmerpenguins')
library('palmerpenguins')

install.packages('ggplot2')
library('ggplot2')

data("penguins")
View(penguins)

# visualize body mass vs flipper length (do more massive birds have larger flippers?)
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species))

#visualize as above but smooth instead of point and B&W for readability
ggplot(data = penguins) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species))



# visualize body mass vs flipper length segmented by species
ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g)) +
  geom_point(aes(shape=species,color=species)) + 
  facet_wrap(~species) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length (Species)")

# visualize body mass vs flipper length segmented by island 
ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g)) +
  geom_point(aes(shape=species,color=island)) + 
  facet_wrap(~island) +
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length (Island)")


# visualize body mass and island location (do bigger birds live on a particular island?)
ggplot(penguins, aes(x = island, y = body_mass_g)) +
  geom_boxplot() +
  facet_wrap(~species) +
  labs(
    title = "Penguin Body Mass by Island",
    x = "Island",
    y = "Body Mass (g)"
  )

