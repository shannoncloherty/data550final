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