#!/bin/bash

# Directivas de SLURM

#SBATCH -p hpc-bio-pacioli        # Nombre de la partición (cola)
#SBATCH --chdir=/home/alumno09/lab-python # Directorio de trabajo
#SBATCH -J python_reduc           # Nombre del trabajo SLURM
#SBATCH --output=slurm-%j.out     # Archivo de salida estándar (%j se reemplaza por JobID)
#SBATCH --error=slurm-%j.err      # Archivo de error estándar
#SBATCH --cpus-per-task=1         # Número de CPUs por tarea (para Python secuencial)
#SBATCH --mail-type=NONE          # Desactivar notificaciones por correo electrónico

# Cargar el módulo anaconda/2023.03
echo "Cargando módulo anaconda/2023.03..."
module load anaconda/2023.03
echo "Módulo cargado."

# Obtener el número de elementos del primer argumento del script SLURM
NUM_ELEMENTS=$1
if [ -z "$NUM_ELEMENTS" ]; then
    echo "ERROR: Debe proporcionar el número de elementos como argumento (ej: sbatch script.sh 10000000)."
    exit 1
fi

echo "--- Iniciando ejecución del notebook para ${NUM_ELEMENTS} elementos ---"
date

# Ejecutar el notebook usando ipython y pasar el número de elementos como argumento
# --no-input y --no-prompt para un output más limpio
ipython "$PWD/reduc-operation-alumno09.ipynb" "$NUM_ELEMENTS"

echo "--- Trabajo finalizado ---"
date

