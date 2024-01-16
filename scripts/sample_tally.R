library(dplyr)

ny <- read.csv("private_data/nysdot_sample_tally.csv")

# visual by point
nysum.vis <- ny %>%
  filter(!is.na(vis)) %>%
  group_by(pid) %>%
  summarize(vis = max(vis, na.rm = T))
nrow(nysum.vis)
sum(nysum.vis$vis)
# 4 of 166 visual positive = 2%

# visual by stop
nysum.vis.stops <- nysum.vis %>%
  mutate(stop = substr(pid, 1,3)) %>%
  group_by(stop) %>%
  summarize(vis = max(vis, na.rm = T))
nrow(nysum.vis.stops)
sum(nysum.vis.stops$vis)
# 2 of 82 visual positive = 2%

# edna by point
nysum.edna <- ny %>%
  filter(!is.na(edna)) %>%
  group_by(pid) %>%
  summarize(edna = max(edna, na.rm = T))
nrow(nysum.edna)
sum(nysum.edna$edna)
# 74 of 169 eDNA positive = 44%

# edna by stop
nysum.edna.stops <- nysum.edna %>%
  mutate(stop = substr(pid, 1,3)) %>%
  group_by(stop) %>%
  summarize(edna = max(edna, na.rm = T))
nrow(nysum.edna.stops)
sum(nysum.edna.stops$edna)
# 41 of 83 visual positive = 49%

