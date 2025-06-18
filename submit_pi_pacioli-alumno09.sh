#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli         
#SBATCH --chdir=/home/alumno09/lab-python 
#SBATCH -J pi_montecarlo_opt      
#SBATCH --output=pi_output_%j.out 
#SBATCH --error=pi_error_%j.err   
#SBATCH --cpus-per-task=1        
#SBATCH --mail-type=NONE         

echo "--- Iniciando ejecución del notebook de PI optimizado ---"
date

# Cargar el módulo anaconda/2023.03
echo "Cargando módulo anaconda/2023.03..."
module load anaconda/2023.03
echo "Módulo cargado."

# Ejecutar el notebook usando ipython.

# Ejemplo para ejecutar con el número de intentos que ya tiene el notebook:
ipython "$PWD/pi-solution-alumno09.ipynb"

echo "--- Trabajo finalizado ---"
date