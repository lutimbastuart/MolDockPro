		                     Intertromics AB / AfriBioMol AB 
            			 Protein Structure Dynamics AND Drug Discovery 
    	                     		   By Lutimba Stuart
		               Research Fellow at the National Tsing Hua University

Introduction!
This bash repo, processes the docked poses from docking by combinding the single poses into a trajectory file in a .pdb file format. 
The MolDockPro:
	This package processes Ligands from docking, in preparation for a comprehensive analysis in form of Trajectory. 
Computational molecular docking is used by computational Chemist to predict ligand-protein bound conformation as well as free binding energies. Howerver challanges arises from the workable/appropriate format required for the down stream analysis. The combination of all docked  posess into a single trajectory file (.pdb) emerges as a universal format for majority of analysis tools like, MDanalysis, MDtraj and a Grommacs Analysis Suit. Therefore MolDockPro utilizes some of the reknown tools to covert *pdbqt files to pdb and then combined all the pdb files obtained with bash. 


Application of the code.
 

This only requires the openbable. 
        Openbable: Open Babel version: 3.1.0
           Intallation: 
                Code: To install this package with conda run one of the following:
                conda install -c conda-forge openbabel
                conda install -c conda-forge/label/cf202003 openbabe


1.run the script as ./moldockpro.sh or bash moldockpro.sh
2. Please provide the receptor file: (ie; Psudo_Knot.pdb)
3. The output file is a PDB trajectory file with number of frames equal to the number of ligands previously in th pdbqt file.
4.Visualize the trajectory in VMD (Visual Molecular Dynamics)

Wish you all the best: 
