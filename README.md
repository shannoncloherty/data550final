# Final Project

Shannon Cloherty

------------------------------------------------------------------------

## Initial code description

`01_make_table.R`
  - makes table 1
  - saves the data as a `.rds` object in `output/`
  - saves table 1 as a `.rds` object in `output/`
  
`02_make_figure.R`
  - makes figure 1
  - saves a factor for formatting as a `.rds` object in `output/`
  - saves the figure as a `.rds` object in `output/`
  
`03_render_report.R`
  - renders the report as an html
  
`Makefile`
  - executes code for `01_make_table.R`, `02_make_figure.R`, and 
    `03_render_report.R`

------------------------------------------------------------------------

## Generating the report

In the `Makefile`, the code to `make Report.html` will render the report.

The report contains information data that were collected in September 2023 
during a primarily qualitative research study documenting and analyzing gender 
equality and social inclusion (GESI) in global water, sanitation, and hygiene
(WASH) programs at an international NGO. The report contains information on WASH
staff in different countries, gender ratio of staff per country, and the number
of people interviewed per global region as designated by the NGO.

------------------------------------------------------------------------

## Package synchronization

In the `Makefile`, the code to `make install` will restore the package versions
based on the lockfile `renv.lock`.

------------------------------------------------------------------------

## Data Dictionary

id: interview number

region: there are 6 regions designated by the NGO

multiple_people: were there multiple people in the interview? 0 = no, 1 = yes

number_people_int: total number of people present for each interview

number_people_int_male: number of men present for each interview

number_people_int_female: number of women present for each interview

wash_staff_total: how many total WASH staff are in the country?

wash_staff_gesi_trained: how many WASH staff have been trained in GESI?

wash_staff_gesi_trained_percent: computed percentage of WASH staff who have been trained in GESI

gesi_training_modality: how was GESI training delivered? answer options: Online, Online and in person, In person

gesi_training_duration_days: number of days of GESI training

wash_staff_field: number of staff designated as field staff

wash_staff_no: number of staff designated as National Office (NO) staff

wash_staff_no_percent_female: reported percentage of NO staff who are female

wash_staff_field_percent_female: reported percentage of field staff who are female

wash_staff_gesi_background: Do any members of staff have a background in GESI? answer options: Yes, No

gesi_budget: does the WASH team have a budget for GESI? answer options: Yes, No, and Not separately (meaning GESI items are included in the WASH budget)
