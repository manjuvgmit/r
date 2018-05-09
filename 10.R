######## GG Plot(Grammer Graphic) ###########
# Install packages 'ggplot'
# facet is group by for charts
library(ggplot2)
ggplot(data = mtcars, aes(x = hp, y = mpg)) # This won't work

# Smoothen the plot
ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point()+
  geom_smooth(method = 'lm')

# Add title, subtitle etc
ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point()+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+ylab("MPG")

# Change color of plot points
ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point(col = 'steelblue', size = 5)+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+
  ylab("MPG")

ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point(aes(col = 'cyl', size = 5))+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+
  ylab("MPG")

# Plot based on 
ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point(aes(col = factor(cyl), size = 5))+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+
  ylab("MPG")

# 
ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point(aes(col = factor(cyl), size = factor(gear)))+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+
  ylab("MPG")

ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point(aes(col = factor(cyl), size = factor(gear)))+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+
  ylab("MPG")+
  facet_grid(~gear) # ~ shows dependency. What the expresiion means "Clasify the chart based on Gear"

# Exporting chart should be done via creating variable inside and then print will export

z = ggplot(data = mtcars, aes(x = hp, y = mpg))+
  geom_point(aes(col = factor(cyl), size = factor(gear)))+
  geom_smooth(method = 'lm')+
  ggtitle('Scatter Diagram', subtitle = 'Correlation B/W HP and MPG')+
  xlab('HP')+
  ylab("MPG")+
  facet_grid(~gear)

print(z)

########## bar Chart
View(mpg)
x = ggplot(mpg, aes(fl))
#x = ggplot(mpg, fl) # is this valid
x+geom_bar()

# fill with single color
x+geom_bar(aes(fill = 'red'))
# based on factor
x+geom_bar(aes(fill = factor(fl))) # factor taken becaus eof non numerical value of 'fl'(fuel)

### Misc : factor function in plotting
mpg$fl[1:10]
levels(mpg$fl)
abc = unique(mpg$fl)
factor(abc) # Levels: c d e p r - Assigns numbers from 1 to n based on value by factor method
### Misc : END

# bar along with statistics on chart
x+geom_bar(aes(fill = factor(fl)))+
  geom_text(stat = 'count', aes(label = ..count..)) # '..count..' is a keyword

mt = head(mtcars)
View(mt)
rownames(mt)
# Without Factor/coloring
ggplot(mt, aes(x = rownames(mt), y = mpg))+
  geom_bar(stat = 'identity')+
  geom_text(stat = 'identity', aes(label = mpg))

# With Factor or coloring
ggplot(mt, aes(x = rownames(mt), y = mpg))+
  geom_bar(stat = 'identity', aes(fill = factor(cyl)))+
  geom_text(stat = 'identity', aes(label = mpg))

# With Facet / Group by
ggplot(mt, aes(x = rownames(mt), y = mpg))+
  geom_bar(stat = 'identity', aes(fill = factor(cyl)))+
  geom_text(stat = 'identity', aes(label = mpg))+
  facet_grid(~gear)


# All Cars : Issues -> x axis values are horizontal
ggplot(mtcars, aes(x = rownames(mtcars), y = mpg))+
  geom_bar(stat = 'identity', aes(fill = factor(cyl)))+
  geom_text(stat = 'identity', aes(label = mpg))

# X axis vertically via theme
ggplot(mtcars, aes(x = rownames(mtcars), y = mpg))+
  geom_bar(stat = 'identity', aes(fill = factor(cyl)))+
  geom_text(stat = 'identity', aes(label = mpg))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# With labels
ggplot(mtcars, aes(x = rownames(mtcars), y = mpg))+
  geom_bar(stat = 'identity', aes(fill = factor(cyl)))+
  geom_text(stat = 'identity', aes(label = mpg))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab(label = 'Cars')+
  ylab(label = 'Miles / Gallon')


# Classic Theme
ggplot(mtcars, aes(x = rownames(mtcars), y = mpg))+
  geom_bar(stat = 'identity', aes(fill = factor(cyl)))+
  geom_text(stat = 'identity', aes(label = mpg))+
  theme_classic()

# Classic Theme # You should remove factor to get this working
ggplot(mtcars, aes(x = rownames(mtcars), y = mpg))+
  geom_bar(stat = 'identity')+
  geom_text(stat = 'identity', aes(label = mpg))+
  theme_bw()


# TODO different themes
