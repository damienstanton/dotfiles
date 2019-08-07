export WRPATH=$HOME/work/signal-graph
export PATH="$WRPATH/backend/scripts:$PATH"
export PATH="$WRPATH/datasci/scripts:$PATH"
# Set GOPATH to default work gopath
export GOPATH="$WRPATH/backend"


# Spark/Scala
export SPARK_HOME="$HOME/spark-2.4.3"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="$ZEPPELIN_HOME/bin:$PATH"
export PYSPARK_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/python"

function work() {
	echo "GOPATH is $GOPATH"
	cd $WRPATH/datasci
	source $WRPATH/datasci/scripts/datasci_env/bin/activate
}

function devstart() {
    work && cd ../backend
    scripts/devctl.sh start
}

function devstop() {
    work && cd ../backend
    scripts/devctl.sh stop
}

function devreboot() {
    work && cd ../backend
    scripts/devctl.sh stop
    make clean
    make install
    bash scripts/devctl.sh start
}

function clean_test() {
    work && cd ../backend
    go clean -cache
	make clean
	make install
	make test
}

function query_prod() {
    # query_prod some_file.json
    curl -X POST $WR_PROD_URL -d @$1 --header "Content-Type: application/json; charset=utf-8" > prod_output.json
}

function query_test() {
    # query_test some_file.json
    curl -X POST $WR_TEST_URL -d @$1 --header "Content-Type: application/json; charset=utf-8" > test_output.json
}
