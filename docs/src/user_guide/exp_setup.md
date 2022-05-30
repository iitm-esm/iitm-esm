## Model Experiment set-up

1. git clone  https://github.com/iitm-esm/iitm-esm.git
2. git checkout -b new-feature

You are in the new branch to set up the experiment

1. compile the model by running the script

        ./compile.sh

2. To create the exp

        ./create_exp.sh -n <exp_name> 

3. cd <exp_name>

4. link the input files from the required set up inside the central repo 

        /home/cccr/cmip/IITM-ESM-DATA

        ln -sf /home/cccr/cmip/IITM-ESM-DATA/inputs/<required_exp>/INPUT INPUT
        cp /home/cccr/cmip/IITM-ESM-DATA/inputs/<required_exp>/*table* .
        cp /home/cccr/cmip/IITM-ESM-DATA/inputs/<required_exp>/*nml* .
        cp /home/cccr/cmip/IITM-ESM-DATA/inputs/<required_exp>/*gfs_namelist* .

5. Copy the corresponding restarts as per your required experiment date

        cp /home/cccr/cmip/IITM-ESM-DATA/ini/<required_exp>/<desired_year>/ RESTART/

6. To copy the initial conditions from the restarts to inputs :

        ./restart2input.sh

7. [Note]: Check if the files required for inputs in atm_data_table, data_table are present in INPUT directory

8. submit the run

        qsub submit_main.pbs






    




