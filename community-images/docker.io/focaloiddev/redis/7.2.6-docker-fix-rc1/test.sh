BASE_PATH=$(pwd)
RESULTS_PATH="$BASE_PATH/results/$ENV_TEST"
mkdir -p $RESULTS_PATH

cd $BASE_PATH/repo && ./runtest --host localhost --port 6379 --dump-logs --tags -slow | tee $RESULTS_PATH/raw_test_stdout.txt
cd $BASE_PATH && python parse_test_out.py $RESULTS_PATH/raw_test_stdout.txt $RESULTS_PATH/result_1.xml
