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
