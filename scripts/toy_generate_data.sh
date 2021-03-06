echo "generating data..."
for ty in "train" "valid" ; do
    rm -rf data/$ty/sr5
    mkdir -p data/$ty/sr5
    for i in {1..2}; do
	rm -rf dimacs/$ty/sr5/grp$i
	mkdir -p dimacs/$ty/sr5/grp$i
	python3 python/gen_sr_dimacs.py dimacs/$ty/sr5/grp$i 500 --min_n 5 --max_n 5 --py_seed $i --np_seed $i
	python3 python/dimacs_to_data.py dimacs/$ty/sr5/grp$i data/$ty/sr5 60000
    done;
done;
