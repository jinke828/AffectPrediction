# install packages
if (!require(remotes)) {
  install.packages("remotes")
}
remotes::install_github('jorvlan/raincloudplots')

library(raincloudplots)
library(tidyverse)
library(ggplot2) 
library(R.matlab)
library(rlist)

## Plot arousal

# load data
arousal_surr = read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/Model/data/FC/arousal_surr.csv')
arousal_surr$Group <- factor(arousal_surr$Group, levels = c("Sherlock", "FNL", "Sher-FNL", "FNL-Sher"))
actual_arousal <- read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/Model/data/FC/actual_arousal.csv')
#plot
ggplot(arousal_surr, aes(x = Group, y = rval))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  ggdist::stat_halfeye(
    # fill="lightgray",
    fill="gray90",
    ## custom bandwidth
    # adjust = .8, 
    ## adjust height
    width = .3, 
    ## move geom to the right
    justification = -.8, 
    ## remove slab interval
    .width = 0, 
    point_colour = NA
  )+
  geom_boxplot(
    data=actual_arousal,
    aes(x = Group, y = rvals, fill=Group, middle = 0.9),
    width = .16,
    outlier.shape = NA,
    fatten = NULL
  )+
  scale_fill_manual(values=c("firebrick","rosybrown1","rosybrown1","firebrick"))+
  ggforce::geom_sina(
    data=actual_arousal,
    aes(x = Group, y = rvals),
    ## draw bigger points
    size = 1.3,
    ## add some transparency
    #alpha =0.5,
    # color = "gray",
    maxwidth = .01,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 10, width = 0
    )
  )+
  # ylim(-0.25, 1)
  scale_y_continuous(limits = c(-0.3, 1), breaks = c(-.25, 0, 0.25, 0.5, 0.75, 1))

ggsave(filename = '/arousal.png', path = '/Users/cablab/Desktop', plot = last_plot(),dpi=1000)












## plot valence

# load data
valence_surr = read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/Model/data/FC/valence_surr.csv')
valence_surr$Group <- factor(arousal_surr$Group, levels = c("Sherlock", "FNL", "Sher-FNL", "FNL-Sher"))
actual_valence <- read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/Model/data/FC/actual_valence.csv')
#plot
ggplot(valence_surr, aes(x = Group, y = rval))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  ggdist::stat_halfeye(
    # fill="lightgray",
    fill="gray90",
    ## custom bandwidth
    adjust = .8, 
    ## adjust height
    width = .3, 
    ## move geom to the right
    justification = -.8, 
    ## remove slab interval
    .width = 0, 
    point_colour = NA
  )+
  geom_boxplot(
    data=actual_valence,
    aes(x = Group, y = rvals, fill=Group, middle = 0.9),
    width = .16,
    outlier.shape = NA,
    fatten = NULL
  )+
  scale_fill_manual(values=c("royalblue","lightskyblue1","lightskyblue1","royalblue"))+
  ggforce::geom_sina(
    data=actual_valence,
    aes(x = Group, y = rvals),
    ## draw bigger points
    size = 1.3,
    ## add some transparency
    # alpha =0.5,
    # color = "gray",
    maxwidth = .01,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 10, width = 0
    )
  )+
  # ylim(-0.25, 1)
  scale_y_continuous(limits = c(-0.3, 1), breaks = c(-.25, 0, 0.25, 0.5, 0.75, 1))

ggsave(filename = '/valence.png', path = '/Users/cablab/Desktop', plot = last_plot(),dpi=1000)






## plot positivity 

# load data
pos_surr = read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/NHB\ Model\ Prediction/data/FC/positivity_surr.csv')
pos_surr$Group <- factor(arousal_surr$Group, levels = c("Sherlock", "FNL", "Sher-FNL", "FNL-Sher"))
actual_pos <- read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/NHB\ Model\ Prediction/data/FC/actual_positivity.csv')
#plot
ggplot(pos_surr, aes(x = Group, y = rval))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  ggdist::stat_halfeye(
    # fill="lightgray",
    fill="gray90",
    ## custom bandwidth
    adjust = .8, 
    ## adjust height
    width = .3, 
    ## move geom to the right
    justification = -.8, 
    ## remove slab interval
    .width = 0, 
    point_colour = NA
  )+
  geom_boxplot(
    data=actual_pos,
    aes(x = Group, y = rvals, fill=Group, middle = 0.9),
    width = .16,
    outlier.shape = NA,
    fatten = NULL
  )+
  scale_fill_manual(values=c("steelblue1","cadetblue1","cadetblue1","steelblue1"))+
  ggforce::geom_sina(
    data=actual_pos,
    aes(x = Group, y = rvals),
    ## draw bigger points
    size = 1.2,
    ## add some transparency
    alpha =0.5,
    # color = "gray",
    maxwidth = .01,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 10, width = 0
    )
  )+
  # ylim(-0.25, 1)
  scale_y_continuous(limits = c(-0.3, 1), breaks = c(-.25, 0, 0.25, 0.5, 0.75, 1))

ggsave(filename = '/pos.png', path = '/Users/cablab/Desktop', plot = last_plot(),dpi=1000)









## plot negativity

# load data
neg_surr = read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/NHB\ Model\ Prediction/data/FC/negativity_surr.csv')
neg_surr$Group <- factor(arousal_surr$Group, levels = c("Sherlock", "FNL", "Sher-FNL", "FNL-Sher"))
actual_neg <- read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/NHB\ Model\ Prediction/data/FC/actual_negativity.csv')
#plot
ggplot(neg_surr, aes(x = Group, y = rval))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  ggdist::stat_halfeye(
    # fill="lightgray",
    fill="gray90",
    ## custom bandwidth
    adjust = .8, 
    ## adjust height
    width = .3, 
    ## move geom to the right
    justification = -.8, 
    ## remove slab interval
    .width = 0, 
    point_colour = NA
  )+
  geom_boxplot(
    data=actual_neg,
    aes(x = Group, y = rvals, fill=Group, middle = 0.9),
    width = .16,
    outlier.shape = NA,
    fatten = NULL
  )+
  scale_fill_manual(values=c("royalblue3","dodgerblue","dodgerblue","royalblue3"))+
  ggforce::geom_sina(
    data=actual_neg,
    aes(x = Group, y = rvals),
    ## draw bigger points
    size = 1.2,
    ## add some transparency
    alpha =0.5,
    # color = "gray",
    maxwidth = .01,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 10, width = 0
    )
  )+
  # ylim(-0.25, 1)
  scale_y_continuous(limits = c(-0.3, 1), breaks = c(-.25, 0, 0.25, 0.5, 0.75, 1))

ggsave(filename = '/neg.png', path = '/Users/cablab/Desktop', plot = last_plot(),dpi=1000)




## Plot cross arousal

# load data
arousal_surr = read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/Model/data/FC/generalize/arousal_surr.csv')
arousal_surr$Group <- factor(arousal_surr$Group, levels = c("Merlin", "North"))
actual_arousal <- read.csv('/Users/cablab/Desktop/NHB/scripts/z_make_graphs/Model/data/FC/generalize/actual_arousal.csv')
#plot
ggplot(arousal_surr, aes(x = Group, y = rval))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  ggdist::stat_halfeye(
    # fill="lightgray",
    fill="gray90",
    ## custom bandwidth
    adjust = .8, 
    ## adjust height
    width = .3, 
    ## move geom to the right
    justification = -.8, 
    ## remove slab interval
    .width = 0, 
    point_colour = NA
  )+
  geom_boxplot(
    data=actual_arousal,
    aes(x = Group, y = rvals, fill=Group, middle = 0.9),
    width = .16,
    outlier.shape = NA,
    fatten = NULL
  )+
  scale_fill_manual(values=c("rosybrown1","rosybrown1"))+
  ggforce::geom_sina(
    data=actual_arousal,
    aes(x = Group, y = rvals),
    ## draw bigger points
    size = 1.3,
    ## add some transparency
    #alpha =0.5,
    # color = "gray",
    maxwidth = .01,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 10, width = 0
    )
  )+
  # ylim(-0.25, 1)
  scale_y_continuous(limits = c(-0.3, 1), breaks = c(-.25, 0, 0.25, 0.5, 0.75, 1))

ggsave(filename = '/overlap-arousal.png', path = '/Users/cablab/Desktop', plot = last_plot(),dpi=1000)

