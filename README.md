# Liga-MX-Case-Study

For this project, I selected a dataset from Kaggle created by Gerardo Jaime Escareño: https://www.kaggle.com/datasets/gerardojaimeescareo/ligamx-matches-2016-2022?resource=download

The dataset includes match data from the Liga MX spanning the 2016 to 2024 seasons, comprising 2,867 observations and 25 variables. As a passionate soccer fan and a dedicated supporter of my hometown team, Toluca, I was particularly interested in analyzing this dataset.

The primary goal of this project was to practice data cleaning and analysis using R and RStudio. My focus was on evaluating Toluca's performance over the given period and comparing it to both the highest and lowest-performing teams in the league.

Upon uploading the dataset, I noticed an inconsistency in the number of teams listed—24 teams were identified, although there are only 22 teams in reality. This discrepancy was due to minor grammatical variations in team names. For example, "León" and "Leon" as well as "Atlético San Luis" and "Atletico San Luis" were treated as separate entities. To address this, I standardized team names across the dataset to ensure consistency. Specifically, I merged the data under the correct spellings of León and Atlético San Luis. This step was essential to ensure accurate analysis and avoid skewed results due to duplicate entries.

Next, I standardized the performance results for each team by calculating their total number of wins, draws, and losses—both at home and away. These metrics were then aggregated and merged into a consolidated team_stats table, providing a comprehensive overview of each team's overall performance throughout the dataset.

While it was difficult to admit as a Toluca fan, Club América emerged as the top-performing team in the dataset, with a record of 178 wins, 73 losses, and 99 draws. In comparison, my hometown team, Toluca, recorded 126 wins, 104 losses, and 85 draws over the same period.
For a meaningful comparison, I chose to analyze the lowest-performing team currently active in Liga MX. Although several teams such as Monarcas, Veracruz, Lobos BUAP, and Jaguares de Chiapas were included in the dataset, I excluded them from this analysis as they have been relegated or are no longer part of the league. Instead, I focused on Mazatlán, the team with the weakest performance among those still active in Liga MX, which recorded 38 wins, 76 losses, and 21 draws. 

To better illustrate the performance differences, I created a bar chart comparing the match results of Club América, Toluca, and Mazatlán—representing the top-performing team, my favorite team, and the lowest-performing active team, respectively.
The chart clearly highlights Club América’s dominance, with 2.4 times more wins than losses, underscoring their status as one of the most successful teams in Liga MX during the analyzed period. This visualization provides a compelling snapshot of the competitive landscape within the league. 

As a Toluca supporter, it's compelling to consider what strategies the team could adopt to replicate the success of a club like Club América. However, it's clear that financial resources play a significant role in shaping a team’s performance. Clubs with greater funding, like Club América, are better positioned to build and maintain top-tier squads—something that can be more challenging for teams like Toluca or newer entrants like Mazatlán.

Given these limitations, Toluca could benefit from investing in its youth academy system, focusing on developing homegrown talent. This approach not only strengthens the first team but also creates opportunities for player transfers abroad, which can be reinvested into the club.

Despite the disparities, it’s encouraging to see the competitive diversity within Liga MX. Exploring this landscape through data has deepened my appreciation for the sport and the dynamics that shape it.
