here::i_am('02_make_figure.R')

pacman::p_load(readxl,
               ggplot2,
               dplyr,
               ggfittext,
               gtsummary)

gesi <- read_excel('PreSurveyData_clean.xlsx')

regions_factor <- c("Asia Pacific","Middle East & Eastern Europe","East Africa",
                    "Southern Africa","West Africa","Latin America & Caribbean")

saveRDS(
  regions_factor,
  file = here::here("output", "regions_factor.rds")
)

colors <- c("#8C2B76","#F78DCB", "#FFF199","#00BD9D","#55B3F1", "#574AE2")

figure <- ggplot(gesi, 
                 aes(x=factor(region,regions_factor), 
                     y=number_people_int, 
                     fill=factor(region, regions_factor))) +
  stat_summary(fun= sum , geom="bar") +
  stat_summary(aes(label=(..y..)), fun=sum, geom="text", size=4,
               vjust = 0.5, hjust = -1) +
  coord_flip() +
  scale_fill_manual(values = c(colors)) +
  theme(legend.position="none",
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  ggtitle('Number of People Interviewed') +
  xlab('Region') +
  ylab('Number') +
  ylim(c(0,13)) +
  labs(caption = "n=42 total interviewees")

saveRDS(
  figure,
  file = here::here("output", "figure.rds")
)