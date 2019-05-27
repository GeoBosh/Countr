library(dplyr)
library(Countr)
#taking subset data for example
exampledata <- subset(football, seasonId == 2009)
#reoganizing data
test.data <- rbind(
  data.frame(goals=exampledata$homeTeamGoals,
             team=exampledata$homeTeam,
             opponent=exampledata$awayTeam,
             home=1),
  data.frame(goals=exampledata$awayTeamGoals,
             team=exampledata$awayTeam,
             opponent=exampledata$homeTeam,
             home=0))
#function created to create weights based on dates of games
DCweights <- function(dates, currentDate=exampledata$gameDate[380], xi=0){
  #had to divide by 86400 to account for seconds in a day
  #becasue was calculating datediffs in seconds instead of days, can be removed if it calculates in days not seconds
  datediffs <- (dates - currentDate)/86400 
  datediffs <- as.numeric(datediffs) *-1
  w <- exp(-1*xi*datediffs)
  w[datediffs < 0] <- 0 #Future dates should have zero weights
  return(w)
}

timeweights <- DCweights(exampledata$gameDate,currentDate=exampledata$gameDate[380],xi=.012)
timeweights <- c(timeweights,timeweights) #doubled to match length of data used in model

xtimes <- 1 
weibull_model <- renewalCount(formula = goals ~ home + team + opponent, 
                              data = test.data, dist = "weibull", 
                              weiMethod = "conv_dePril", computeHessian = FALSE,
                              control = renewal.control(trace = 0, method = "nlminb"),
                              weights = timeweights)

