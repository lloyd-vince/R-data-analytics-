library(ggplot2)
library(palmerpenguins)

# Load the penguins dataset
# Data Exploration 
# Step 1 
data("penguins")
str(penguins)
head(penguins)
summary(penguins)

#Step 2
# Understand the variables - summary ()

#Check for missing data 
sum(is.na(penguins))

# Check missing data by column
colSums(is.na(penguins))

#Step 3 - Explore individual varaibles 
summary(penguins)
# Identify Categorical vs Numerical 
# 1. Categorical variables (Species, Island and sex)
table(penguins$species)
table(penguins$island)

#2. Numerical variables (bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g,
# year)
#summary of statistics
summary(penguins$bill_length_mm)
summary(penguins$flipper_length_mm)

#create histograms 
# Histogram of bill length
ggplot(penguins, aes(x = bill_length_mm)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  theme_minimal()

# Histogram of body mass
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 100, fill = "green", color = "black") +
  theme_minimal()

#Step 3 - Explore Relationships between varibales
# Scatterplots - Explore the relationship between two numerical variables
# Scatterplot of bill length vs. bill depth
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, colour = species)) +
  geom_point() +
  theme_minimal()
# Scatterplot of flipper length vs. body mass
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  theme_minimal()

#Boxplots - compare the distribution of a numerical variable across differentn categories
# Boxplot of body mass by species
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot() +
  theme_minimal()
# Boxplot of flipper length by island
ggplot(penguins, aes(x = island, y = flipper_length_mm)) +
  geom_boxplot() +
  theme_minimal()

#Faceting - break down the data into smaller plots to compare subsets
# Facet scatterplot by species
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  facet_wrap(~species) +
  theme_minimal()

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  facet_wrap(~island) +
  theme_minimal()

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  facet_wrap(~sex) +
  theme_minimal()

ggplot(penguins, aes(fill = sex, x = species)) +
  geom_bar(position = "dodge")

# 1. Start with a basic scatterplot
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point()

# 2. Add color based on species
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point()

# 3. Add a smooth line
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  geom_smooth()

# 4. Facet the plot by species
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  facet_wrap(~species)

# 5. Apply a theme
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  theme_minimal()

ggplot(mtcars, aes(
  x = hp,
  y = mpg
)) +
  geom_point() +
 geom_smooth() +
  facet_wrap(~cyl)

ggplot() +
  geom_point(mpg, aes(x = displ, y = hwy))
