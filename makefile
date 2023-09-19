VLOG =  /tools/mentor/questasim/questasim/bin/vlog


VSIM = /tools/mentor/questasim/questasim/bin/vsim


all: comp_rtl comp run

comp_rtl:
	$(VLOG) +cover=bcstfex /hwetools/work_area/frontend/Sukhitha/uvm/fifo_coding/design.sv

comp: 
	$(VLOG) +incdir+/hwetools/work_area/frontend/Sukhitha/uvm/1800.2-2020-2.0/src/hwetools/work_area/frontend/Sukhitha/uvm/1800.2-2020-2.0/srcuvm_pkg.sv +define+UVM_NO_DPI /hwetools/work_area/frontend/Prasthuthi/FIFO_UVM_CODE/fifo_interface.sv //hwetools/work_area/frontend/Prasthuthi/FIFO_UVM_CODE/testbench.sv  

run: 
	$(VSIM)   -coverage  -novopt testbench +UVM_TESTNAME=test_read_write -l vsim.log -c
       ##add wave -r
