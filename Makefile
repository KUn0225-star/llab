# Цель по умолчанию
all: lab.pdf all_images.pdf
 # Компиляция LaTeX-документа
lab.pdf: lab.tex Screenshot_2.jpg Screenshot_1.png 3.4.1-1.png 3.4.1-2.png	
	pdflatex lab.tex
	pdflatex lab.tex  # Вторая компиляция для корректных ссылок
# Очистка временных файлов
clean:
	rm -f *.aux *.log *.out lab.pdf images.tex all_images.pdf

# Создание PDF из всех PNG с подписями
all_images.pdf: images.tex $(wildcard *.png *.jpg) 
	pdflatex images.tex

#  # Автоматическая генерация images.tex с перечислением всех PNG
images.tex: $(wildcard *.png *.jpg)
	echo "\documentclass{article}" > images.tex; \
	echo "\usepackage{graphicx}" >> images.tex; \
	echo "\begin{document}" >> images.tex; \
	for img in *.png *.jpg; do \
		echo "\section*{$$img}" >> images.tex; \
		echo "\includegraphics[width=\linewidth]{$$img}" >> images.tex; \
	done; \
	echo "\end{document}" >> images.tex
