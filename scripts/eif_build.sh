#!/bin/sh
#
# simple script to build Eiffel software components 
#
#

app_dir=$OPENEHR/implem-dev/tools/eiffel/adl_workbench/app
lib_dir=$OPENEHR/implem-dev/tools/eiffel/adl_workbench/shared_lib
dist_dir=$OPENEHR/implem-dev/distribution/tools/windows
err_file=$OPENEHR/implem-dev/scripts/eif_build_errs.txt

dirs=$app_dir/* $lib_dir/*

OPENEHR="c:\\project\\openehr"

rm $err_file

for dir in $dirs
do
	echo "---------------------------------------------------------------" | tee -a $err_file
	echo "Building $dir" | tee -a $err_file
	cd $dir
	echo "rm -rf *.epr EIFGEN"
	rm -rf *.epr EIFGEN

	echo "ec -batch -ace ace.ace -finalize -c_compile" | tee -a $err_file
	ec -batch -ace ace.ace -finalize -c_compile > $err_file

	cd EIFGEN/W_code
	echo "finish_freezing -silent" | tee -a $err_file
	finish_freezing  -silent > $err_file
done

#
cd $dist_dir/adl_workbench
bk edit
cd $dist_dir/adl_dotnet_tools
bk edit

cp $app_dir/cmd_line/EIFGEN/F_code/adl_validator.exe $dist_dir/adl_workbench
cp $app_dir/cmd_line/*.cfg $dist_dir/adl_workbench

cp $app_dir/gui_vision2/EIFGEN/F_code/adl_gui_vision2.exe $dist_dir/adl_workbench
cp $app_dir/gui_vision2/icons/* $dist_dir/adl_workbench/icons
cp $app_dir/gui_vision2/*.cfg $dist_dir/adl_workbench/icons

cp $lib_dir/dotnet_libs/EIFGEN/F_code/*.dll $dist_dir/adl_dotnet_tools

cp $lib_dir/java_lib/EIFGEN/F_code/*.dll $dist_dir/adl_java_lib
cp $lib_dir/java_lib/*.java $dist_dir/adl_java_lib
