for rate in 39 60 30 15 00
do
    echo "Running with twin rate $rate..."
    mpiexec -n 28 ./irrplasticity-opt -i poly20g04b02fcc${rate}.i
done