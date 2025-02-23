all:
	vivado -mode batch -source run.tcl

clean:
	rm *.jou
	rm *.log
