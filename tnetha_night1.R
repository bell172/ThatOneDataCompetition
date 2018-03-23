jobs <- read.csv('Documents/datafest2018.csv')
colnames(jobs)
nrow(jobs)
View(jobs)
library(ggplot2)
ggplot() + geom_histogram(aes(jobs$jobagedays),bins = 100)
tail(sort(table(jobs$city)),100)
length(unique(jobs$jobHash))
range(as.Date(as.character(jobs$date)))
unique(jobs$admin1)
sort(summary(jobs$admin1))
jobs$maskedEmployerName
sort(summary(jobs$normtitle))
sort(summary(jobs$normtitlecategory))
sort(tapply(jobs$clicks,jobs$normtitlecategory,mean))
tapply(jobs$clicks,jobs$date,sum)      

# Plot of sum of clicks versus of dates
clicks_date <- data.frame(dates=seq(as.Date(as.character('2016-12-01')),as.Date(as.character('2018-01-31')),by='days')
                          ,clicks=tapply(jobs$clicks,jobs$date,sum))
ggplot(data = clicks_date,aes(dates,clicks)) + geom_point(data = clicks_date,aes(dates,clicks)) + geom_smooth() + scale_x_date(date_breaks = '3 week') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Plot of sum of applies versus of dates
applies_date <- data.frame(dates=seq(as.Date(as.character('2016-12-01')),as.Date(as.character('2018-01-31')),by='days')
                          ,applies=tapply(jobs$applies,jobs$date,sum))
ggplot(data = applies_date,aes(dates,applies)) + geom_point() + geom_smooth() + scale_x_date(date_breaks = '3 week') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

