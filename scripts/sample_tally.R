library(dplyr)

ny <- read.csv("private_data/nysdot_sample_tally.csv")

nysum.vis <- ny %>%
  filter(!is.na(vis)) %>%
  group_by(pid) %>%
  summarize(vis = max(vis, na.rm = T))
nrow(nysum.vis)
sum(nysum.vis$vis)
# 4 of 166 visual positive = 2%

nysum.edna <- ny %>%
  filter(!is.na(edna)) %>%
  group_by(pid) %>%
  summarize(edna = max(edna, na.rm = T))
nrow(nysum.edna)
sum(nysum.edna$edna)
# 74 of 169 eDNA positive = 44%


