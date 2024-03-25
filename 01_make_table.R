here::i_am('01_make_table.R')

pacman::p_load(readxl,
               ggplot2,
               dplyr,
               ggfittext,
               gtsummary)

gesi <- read_excel('PreSurveyData_clean.xlsx')

saveRDS(
  gesi,
  file = here::here("output", "gesi.rds")
)

table_one <- gesi %>%
  select("region", "wash_staff_gesi_trained_percent", "wash_staff_field_percent_female", "wash_staff_no_percent_female", "gesi_budget") %>%
  tbl_summary(by = region,
              type = list(wash_staff_no_percent_female ~ "continuous"),
              statistic = list(all_continuous() ~ "{mean} ({sd})",
                               all_categorical() ~ "{n} / {N} ({p}%)"),
              missing_text = "(Missing)",
              label = list(wash_staff_gesi_trained_percent ~ "Percent of Staff Trained in GESI",
                           wash_staff_field_percent_female ~ "Percent of Field Staff who are Female",
                           wash_staff_no_percent_female ~ "Percent of National Office Staff who are Female",
                           gesi_budget ~ "Do you have a budget for GESI?"))

saveRDS(
  table_one,
  file = here::here("output", "table_one.rds")
)
