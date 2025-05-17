# Install and load necessary packages
install.packages(c("dplyr", "ggplot2", "lubridate", "tidyr"))
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)

# Load CSV file as dataframe
df <- read.csv("C:/Users/Jair/Documents/2016_2024_Liga_MX.csv")

# Preparing Data
df$date <- as.Date(df$date)  # Convert date column
df$year <- year(df$date)     # Extract by Year

# Create result column based on match outcome
df <- df %>%
  mutate(
    result = case_when(
      home_goals > away_goals ~ "HomeWin",
      home_goals < away_goals ~ "AwayWin",
      home_goals == away_goals ~ "Draw"
    )
  )

# Standardize team names (combine "León" and "Leon" as "Leon")
df$home_team <- gsub("Le[oó]n", "Leon", df$home_team)
df$away_team <- gsub("Le[oó]n", "Leon", df$away_team)
df$home_team <- gsub("Atl[eé]tico San Luis", "Atletico San Luis", df$home_team)
df$away_team <- gsub("Atl[eé]tico San Luis", "Atletico San Luis", df$away_team)

# Standardize team column names early
home_wins <- df %>%
  filter(result == "HomeWin") %>%
  count(team = home_team, name = "home_wins")

away_wins <- df %>%
  filter(result == "AwayWin") %>%
  count(team = away_team, name = "away_wins")

home_losses <- df %>%
  filter(result == "AwayWin") %>%
  count(team = home_team, name = "home_losses")

away_losses <- df %>%
  filter(result == "HomeWin") %>%
  count(team = away_team, name = "away_losses")

home_draws <- df %>%
  filter(result == "Draw") %>%
  count(team = home_team, name = "home_draws")

away_draws <- df %>%
  filter(result == "Draw") %>%
  count(team = away_team, name = "away_draws")

# Merge everything by `team`
total_stats <- full_join(home_wins, away_wins, by = "team") %>%
  full_join(home_losses, by = "team") %>%
  full_join(away_losses, by = "team") %>%
  full_join(home_draws, by = "team") %>%
  full_join(away_draws, by = "team") %>%
  mutate(
    total_wins = coalesce(home_wins, 0) + coalesce(away_wins, 0),
    total_losses = coalesce(home_losses, 0) + coalesce(away_losses, 0),
    total_draws = coalesce(home_draws, 0) + coalesce(away_draws, 0)
  ) %>%
  select(team, total_wins, total_losses, total_draws) %>%
  arrange(desc(total_wins))

# Print results of all the Liga MX teams
print(head(total_stats, 22))

# Select teams to visualize
team_names <- c("Toluca", "Club America", "Mazatlán")

# Filter and reshape for plotting
team_stats <- total_stats %>%
  filter(team %in% team_names) %>%
  pivot_longer(cols = c(total_wins, total_losses, total_draws),
               names_to = "Result", values_to = "Count") %>%
  mutate(
    Result = recode(Result,
                    total_wins = "Wins",
                    total_losses = "Losses",
                    total_draws = "Draws")
  )

# Create the bar chart
ggplot(team_stats, aes(x = Result, y = Count, fill = Result)) +
  geom_bar(stat = "identity", width = 0.6) +
  facet_wrap(~ team) +
  scale_fill_manual(values = c("Wins" = "forestgreen", "Losses" = "firebrick", "Draws" = "darkgray")) +
  scale_x_discrete(labels = NULL) +  # Removes x-axis labels (Wins, Losses, Draws)
  labs(
    title = "Match Outcomes",
    y = "Number of Matches"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_blank(),  # Remove x-axis text (repetition of the legend)
    axis.title.x = element_blank()  # Remove x-axis title
  )