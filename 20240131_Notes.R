#Data structures
cats_df <- data.frame(coat = c("calico", "black", "tabby")
                   , weight = c(2.1, 5.0, 3.2),
                   likes_strings = c(1,0,1))
cats_df
#Remove cats dataframe
rm(cats)
#str gives structure of R object
# $ means column
str(cats_df)
#Pull likes strings column
cats_df$likes_strings
#Add two pounds to each weight
cats_df$weight + 2
#Paste command
paste("My cat is ", cats_df$coat)
#Add two columns
#Can't add numeric to character
typeof(cats_df$weight) #double allows for decimal point in number
typeof(TRUE) #Boolean operators are logicals
typeof(cats_df$coat) #Character
#To write a file
write.csv(x = cats_df, file = "cats_df.csv")
#Automatically has quotes and row names
write.csv(x = cats_df, file = "cats_df.csv", quote = FALSE, row.names = FALSE)
#Example matrix
example_mat <- matrix(0, ncol = 6, nrow = 3)
example_mat
#dim
dim(example_mat)
dim(cats_df)
#Helps
?write.csv
?data.frame
?c
# Subsetting
head(cats_df)
cats_df[3] # Gives third column in df
cats_df$coat # Gives third column as character vector
cats_df[1,] #gives all information about row 1
cats_df[1,2] #Gives information about first row, second column

#Create numerical vector
1:10
example_mat[1:2,4:6]

#Plotting
#Install package!
install.packages("ggplot2")
library("ggplot2")
#Import file to R
gapminder_df <- read.csv(file = "gapminder_data.csv")
str(gapminder_df)
dim(gapminder_df)
#Plot data
ggplot(data = gapminder_df,
       aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, aes(color = continent))  + 
  labs(x = "GDP per capita", y = "Life expectancy in years") +
  scale_x_log10() + 
  geom_smooth(method = "lm")
# Make multiple plots by continent
  #facet_wrap(.~continent)
#Evaluate lifeExp by year
ggplot(data = gapminder_df,
       mapping = aes(x = year, y = lifeExp,
                     #grouping data
                     group = country
                     )) +
  #add line to connect years
  geom_line() + geom_point(aes(color = continent))

#Make a plot where you modify the shapes and the size of the points
ggplot(data = gapminder_df,
       aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, aes(color = continent, shape = continent, size = pop))  + 
  labs(x = "GDP per capita", y = "Life expectancy in years") +
  scale_x_log10() + 
  geom_smooth(method = "lm")

head(gapminder_df)
?geom_point()
