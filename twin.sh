for rate in 50 150 200 250
do
    echo "Running with twin rate $rate..."
    mpiexec -n 6 ./irrplasticity-opt -i fcctwincalibrate${rate}.i --n-threads=4
done