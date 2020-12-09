package require openlane
set script_dir [file dirname [file normalize [info script]]]

prep -design $script_dir -tag 8dec_rc5_updated_2100_2500_TD_0p4 -overwrite
set save_path $script_dir/../..

run_synthesis
init_floorplan
place_io_ol
run_sta
global_placement_or
tap_decap_or
detailed_placement
run_cts
run_sta
gen_pdn
run_routing
run_magic

save_views       -lef_path $::env(magic_result_file_tag).lef \
                 -def_path $::env(tritonRoute_result_file_tag).def \
                 -gds_path $::env(magic_result_file_tag).gds \
                 -mag_path $::env(magic_result_file_tag).mag \
                 -save_path $save_path \
                 -tag $::env(RUN_TAG)
run_magic_drc
run_magic_spice_export
run_lvs
run_magic_antenna_check
generate_final_summary_report


