## Post-processing the model outputs

1. Model data combine

    - for atm files

            qsub submit_nc_combine_atm.pbs

    - for ocean files

            qsub submit_nc_combine_ocn.pbs 

    Note 1: If the model run gets killed in between the desired years, then the user should make sure to do the step 1 of postprocessing before restarting the run.

    **In case the user did not follow the <Note 1>, then change the start date of the file <nc_combine_nml>.

2. Do the pressure levels conversion using the script:

            qsub submit_plevel.pbs
        
    Note 2: This script assumes that all the atmospheric files start with atm_.

3. To further split model outputs into separate files by variables and time span, go into the splitvar directory by:
            
            cd splitvar
            
    Issue the command:

            pip install .

    [Note: If the user forgets to do a recursive cloning of the iitm-esm repo, then splitvar can be cloned individually in a separate directory using 

            git clone https://github.com/iitm-esm/splitvar.git]

            splitvar atm_mon_*.nc

4. For further diagnostics of model outputs, the user should use the EsmVal directory

            cd ESMValCore

            pip install .
        
     The command <pip install .> installs all the necessary tools needed to use EsmValCore.