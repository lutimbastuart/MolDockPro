#!/usr/bin/bash 
clear
echo -e "\e[34m \e[25m"
echo -e " \t                  Intertromics AB / AfriBioMol AB \n               Protein Structure Modelling / Drug Discovery Department \n        \t                  By Lutimba Stuart"

###-----------Documentation--------------------
#Requirments:
: <<Script_Documentation_ReadME
	Openbable: Open Babel version: 3.1.0
	   Intallation: 
		Code: To install this package with conda run one of the following:
		conda install -c conda-forge openbabel
		conda install -c conda-forge/label/cf202003 openbabe

#How to run the Code!!!
#./moldockpro.sh  or bash moldockpro.sh

####-------End----------------------------------
Script_Documentation_ReadME

###Using Obable to convert the pdbqt file into separate pdb files in .pdb format (numbered numerically.)
echo -e "\n" 
read -e -p "Please input the receptor file (format .pdb) ie; Psudo_Knot.pdb ...?  " receptor

if [ $(which obabel | wc -l) -eq 1 ]
	then
		echo -e "\e[35m Openbable exists on the system:) .............."
		if [ $(ls *.pdbqt | wc -l) -lt 1 ]
		then
			echo "Please provide the '.pdbqt' file in the same directory:.."
		else
			$(obabel -ipdbqt *.pdbqt -opdb -m -O Ligd_pdb_out_docked.pdb)
		fi
	else
		echo -e "\e[48m Openbable doesn't exist on your system ): ......"
		echo -e "\n \e[1m \e[5m Please first install Obable following the link below \n https://anaconda.org/conda-forge/openbabel \n or \nhttp://openbabel.org/wiki/Main_Page"
		echo -e "\e[0m"
		exit
fi 
echo END >> $receptor
for i in $(ls *docked*);
do
sed -i '/END/d' $i
str=$i
rename=`echo ${str: -11} | tr -d ".pdb"`
cat $i $receptor > $rename._lig_pk_combined.pdb
done

#####Combine the .pdb files to form a trajectory with several poses but a single file
ls -1 *_lig* > all_combined.txt

all_files=`echo $(cat all_combined.txt)`

cat $all_files > lig_poses_mol_trajectory.pdb

###-- Cleaning Director
rm *out_docked* all_combined.txt ocke* 

echo -e "\e[1m \e[32m    \t \t @Intertromics_AB && @AfriBioMol_AB"
echo -e "\e[0m \t	\t      ©2022"
