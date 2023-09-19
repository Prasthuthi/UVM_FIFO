VLOG =  /tools/mentor/questasim/questasim/bin/vlog


VSIM = /tools/mentor/questasim/questasim/bin/vsim


all: comp_rtl comp run

comp_rtl:
	$(VLOG) +cover=bcstfex /hwetools/work_area/frontend/Prasthuthi/fifo_uvm/UVM_FIFO/my_fifo.sv

comp: 
	$(VLOG) +incdir+/hwetools/work_area/frontend/Prasthuthi/fifo_uvm/1800.2-2020-2.0/src/hwetools/work_area/frontend/Prasthuthi/fifo_uvm/1800.2-2020-2.0/srcuvm_pkg.sv +define+UVM_NO_DPI /hwetools/work_area/frontend/Prasthuthi/fifo_uvm/UVM_FIFO/fifo_interface.sv //hwetools/work_area/frontend/Prasthuthi/fifo_uvm/UVM_CODE/fifo_top.sv  

run: 
	$(VSIM)   -coverage  -novopt fifo_top +UVM_TESTNAME=test_read_write -l vsim.log -c
       ##add wave -r
