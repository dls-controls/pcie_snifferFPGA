rem Clean up the results directory
rmdir /S /Q results
mkdir results

echo 'Synthesizing HDL example design with XST';
xst -ifn xst_dual.scr
move xilinx_dual_pci_exp_ep.ngc .\results\xilinx_dual_pci_exp_ep.ngc

cd results

echo 'Running ngdbuild'
  ngdbuild -verbose -uc ..\..\example_design\xilinx_dual_pci_exp_blk_plus_4_lane_ep_xc5vlx50t-ff1136-1.ucf xilinx_dual_pci_exp_ep.ngc -sd ..\..\..\

echo 'Running map'
map -timing -ol high -xe c -pr b -o mapped.ncd xilinx_dual_pci_exp_ep.ngd mapped.pcf

echo 'Running par'
par -ol high -xe c -w mapped.ncd routed.ncd mapped.pcf

echo 'Running trce'
trce -u -v 100 routed.ncd mapped.pcf

echo 'Running design through netgen'
netgen -sim -ofmt verilog -ne -w -tm xilinx_dual_pci_exp_ep -sdf_path ..\..\implement\results routed.ncd

echo 'Running design through bitgen'
bitgen -w routed.ncd
