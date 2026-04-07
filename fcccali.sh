for rate in 18 19 20 21
do
    echo "Running with cali number $rate..."
    mpiexec -n 30 ./irrplasticity-opt -i fcc0${rate}calibrate.i
done