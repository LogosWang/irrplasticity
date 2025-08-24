for rate in 100 200 300 400
do
    echo "Running with twin rate $rate..."
    mpiexec -n 22 ./irrplasticity-opt -i fcc0twin${rate}rate.i
done