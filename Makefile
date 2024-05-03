# Project-associated rules (run in container)
Report.html: Report.Rmd 03_render_report.R table_one figure
	Rscript 03_render_report.R

table_one:
	Rscript 01_make_table.R
	
figure:
	Rscript 02_make_figure.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
# Docker-associated rules (run on local machine)

PROJECTFILES = Report.Rmd 01_make_table.R 02_make_figure.R 03_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# rule to build the Docker image and build report automatically for Mac users
final_report/Report.html: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t shannoncloherty/final .
	touch $@
	docker run -v "$$(pwd)"/final_report:/project/final_report shannoncloherty/final
	
# rule to build the report automatically for Windows users
final_report/Report2.html: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t shannoncloherty/final .
	touch $@
	docker run -v "/$$(pwd)"final_report:/project/final_report shannoncloherty/final
