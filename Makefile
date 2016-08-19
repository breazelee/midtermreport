bachelor:
	xelatex midtermreport.tex
	-bibtex midtermreport.aux
	xelatex midtermreport.tex
	xelatex midtermreport.tex

clean:
	find . -name '*.aux' -print0 | xargs -0 rm -rf
	rm -rf *.lof *.log *.lot *.out *.toc *.bbl *.blg *.thm
depclean: clean
	rm -rf *.pdf
