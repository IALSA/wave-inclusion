#The script was adapted from [Will Beasley's illustrations](https://github.com/OuhscBbmc/DeSheaToothakerIntroStats/blob/master/CommonCode/BookTheme.R)



#For fonts, see Chang (2013) Recipe 14.6.  Install ghostscript (http://www.ghostscript.com/download/gsdnld.html),
# before installing the `extrafont` package.
#Run the following three lines of code once per machine (not once per session).
# install.packages("extrafont")
# library(extrafont) 
# extrafont::font_import()
# extrafont::fonts() #This just lists the available fonts for you to read; similar to extrafont::fonttable()

requireNamespace("extrafont", quietly=T)
requireNamespace("grid", quietly=T)
requireNamespace("ggplot2", quietly=T)
requireNamespace("dichromat", quietly=T) 
requireNamespace("RColorBrewer", quietly=T)

#########################################################
### Define theme elements for ggplot2 graphs
#########################################################
# Documentation for modifiable theme elements can be found at http://docs.ggplot2.org/current/theme.html
baseSize <- 10
main_theme <- theme_bw() +
  theme(axis.text = element_text(colour="gray40")) +
  theme(axis.title = element_text(colour="gray40")) +
  theme(panel.border = element_rect(colour="gray80")) +
  theme(axis.ticks.length = grid::unit(0, "cm"))
  # theme(axis.ticks = element_line(colour="gray80"))

NoGridOrYLabelsTheme <- main_theme  + 
  theme(axis.ticks.y = element_blank()) +
  theme(panel.grid = element_blank()) +
  theme(plot.margin=grid::unit(c(.1,.2,.2,0), "lines"))


#########################################################
### Establish the font
#########################################################
## These three lines will use a nondefault font.
# extrafont::loadfonts() #Run this once per session.
# Sys.setenv(R_GSCMD = "C:/Program Files/gs/gs9.10/bin/gswin64c.exe")
# main_theme <- main_theme +  theme(text = element_text(family="Times New Roman"))

#########################################################
### Internal notes
#########################################################
# * The Pre-Press Manager said the dimensions of the images cannot exceed these dimensions: 33 picas wide x 51 picas tall. (5.5" x 8.5")
# *Physical Page width 7"x10"

# list.files(system.file("enc", package="grDevices"))

#########################################################
### Palettes to consider for future graphs
#########################################################
# https://github.com/jrnold/ggthemes
# c("#043227", "#097168", "#ffcc88", "#fa482e", "#f4a32e") #http://colrd.com/palette/22444/
# c("#fea3aa","#f8b88b","#faf884","#baed91","#b2cefe","#f2a2e8") #http://colrd.com/palette/22780/
