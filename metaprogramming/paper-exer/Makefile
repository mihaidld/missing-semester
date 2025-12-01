all: install paper.pdf 

paper.pdf: paper.tex plot-data.png
	pdflatex paper.tex

plot-%.png: %.dat plot.py
	./plot.py -i $*.dat -o $@

install:
	git init
	git add .

.PHONY: clean
clean:
	#rm paper.aux paper.log plot-data.png paper.pdf
	git ls-files -o | xargs rm
	rm -rf .git
