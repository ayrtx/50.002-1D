set projDir "C:/Users/student/Desktop/50.002-1D/work/planAhead"
set projName "matrixtest"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/student/Desktop/50.002-1D/work/verilog/mojo_top_0.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/alu_1.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/reset_conditioner_2.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/matrixDisplay_3.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/gameLogic_4.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/numbersDisplayMain_5.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/scoreMem_6.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/adder_7.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/zvn_8.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/shifter8_9.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/compare8_10.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/boolean_11.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/levelButtonState_12.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/numbersDisplay_13.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/edge_detector_14.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/button_conditioner_15.v" "C:/Users/student/Desktop/50.002-1D/work/verilog/pipeline_16.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/student/Desktop/50.002-1D/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
