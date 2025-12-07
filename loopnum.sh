for loop in 0 60
do
    echo "Running with loop num $loop..."
    mpiexec -n 22 ./irrplasticity-opt -i fcc${loop}twin500slow1soft.i
done