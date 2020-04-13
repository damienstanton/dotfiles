export WRPATH=$HOME/work/graph
export PATH="$WRPATH/backend/scripts:$PATH"
export PATH="$WRPATH/backend/bin:$PATH"
export PATH="$WRPATH/datasci/scripts:$PATH"
export SOLENGPATH="$HOME/work/solutions-engineering"

# Spark/Scala
export SPARK_HOME="$HOME/spark-2.4.4"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="$ZEPPELIN_HOME/bin:$PATH"
export PYSPARK_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/python"
export PYSPARK_DRIVER_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

devctl() {
	$WRPATH/backend/scripts/devctl.sh $@
}

workenv() {
	cd $WRPATH/datasci
	source $WRPATH/datasci/scripts/datasci_env/bin/activate
}

devstart() {
    workenv && cd ../backend
    scripts/devctl.sh start
}

devstop() {
    workenv && cd ../backend
    scripts/devctl.sh stop
}

devreboot() {
    workenv && cd ../backend
    scripts/devctl.sh stop
    make clean
    make install
    bash scripts/devctl.sh start
}

clean_test() {
    workenv && cd ../backend
    go clean -cache
	make clean
	make install
	make test
}

query_prod() {
    # query_prod some_file.json
    curl -X POST $WR_PROD_URL -d @$1 --header "Content-Type: application/json; charset=utf-8" > prod_output.json
}

query_test() {
    # query_test some_file.json
    curl -X POST $WR_TEST_URL -d @$1 --header "Content-Type: application/json; charset=utf-8" > test_output.json
}
