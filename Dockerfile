FROM rocker/r-ubuntu

RUN apt-get update
RUN apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

RUN mkdir output
RUN mkdir renv
RUN mkdir final_report

COPY Makefile .
COPY 01_make_table.R .
COPY 02_make_figure.R .
COPY 03_render_report.R .
COPY Report.Rmd .
COPY PreSurveyData_clean.xlsx .

COPY .Rprofile .
COPY renv.lock .
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

CMD make && mv Report.html final_report