HTML = index.html \
			 schedule.html \
			 projects.html \
			 details.html \
			 syllabus.html \
			 staff.html \
			 hours.html \
			 assign/index.html \
			 labs.html 
AUX_CSS = css/main.css
AUX_TMPL = navbar.tmpl top.tmpl

all: $(HTML)

schedule.tmpl: schedule.in schedule.py
	python3 schedule.py > schedule.tmpl

%.html: %.tmpl $(AUX_TMPL) $(AUX_CSS)
	python3 gen.py $* > $*.html

clean:
	rm $(HTML)
	rm schedule.tmpl
