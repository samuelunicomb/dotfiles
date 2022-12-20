### gnuplot initialization file, to keep in ~
###
### this overrides /usr/local/Cellar/gnuplot/*/share/gnuplot/*/gnuplotrc

### window size
set term qt size 800,600

### font sizes
set tics font ",13"
set key font ",13"
set xlabel font ",14"
set ylabel font ",14"
set title font ",13"

### use high sample rate, default is 100
set samples 1000

### use default line colors, but increase from default width of 1
set linetype 1 lc rgb "#9500d6" lw 1.5
set linetype 2 lc rgb "#009e73" lw 1.5
set linetype 3 lc rgb "#56b4e9" lw 1.5
set linetype 4 lc rgb "#e69f00" lw 1.5
set linetype 5 lc rgb "#f0e442" lw 1.5
set linetype 6 lc rgb "#0072b2" lw 1.5
set linetype 7 lc rgb "#e51e10" lw 1.5
set linetype 8 lc rgb "black"   lw 1.5
set linetype cycle 8
