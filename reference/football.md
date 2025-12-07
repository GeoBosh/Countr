# Football data

Final scores of all matches in the English Premier League from seasons
2009/2010 to 2016/2017.

## Usage

``` r
football
```

## Format

a data.frame with 6 columns and 1104 observations:

- `seasonId`:

  integer season identifier (year of the first month of competition).

- `gameDate`:

  POSIXct game date and time.

- `homeTeam,awayTeam`:

  character home and away team name

- `homeTeamGoals,awayTeamGoals`:

  integer number of goals scored by the home and the away team.

## Details

The data were collected from <https://www.football-data.co.uk/> and
slightly formatted and simplified.
