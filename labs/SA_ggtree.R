library(devtools)
library(ggtree)
library(tidyverse)
library(ape)
library(phytools)
library(phangorn)
library(geiger)
library(adegenet)


####setwd()

SltxB_Tree <- read.tree(file="SltxB_Tree.nwk")
SltxB_states <- read.csv("SltxB_states.csv")




SltxB_Tr1 <- ggtree(SltxB_Tree,
                    layout="fan",
                    open.angle=0,
                    size=1) +
  # geom_tiplab(size=3,
  #            align=FALSE, #aligns tip labels
  #           linetype="dotted", #linetype if align=TRUE
  #          linesize=.1, #line size if align=TRUE
  #         color="black") +
  #ggplot2::xlim(0,10) +
  theme(legend.position="left") 
# geom_text(data=d,
#                 aes(label=label), #numbers
#                hjust=-.5,
#               vjust=0,
#              size=2)


SltxB_Tr1



SltxB_Tr2 <- SltxB_Tr1 %<+% SltxB_states +
  geom_tippoint(size=2,
                aes(
                  color=Lifestyle,
                  shape=Kingdom)) 

SltxB_Tr2

SltxB_Tr3 <- rotate_tree(SltxB_Tr2, 90)

SltxB_Tr3
