
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name TOP -dir "D:/TOP/planAhead_run_3" -part xc7a100tcsg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/TOP/TOP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/TOP} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "TOP.ucf" [current_fileset -constrset]
add_files [list {TOP.ucf}] -fileset [get_property constrset [current_run]]
link_design
