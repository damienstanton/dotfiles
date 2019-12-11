export WRPATH=$HOME/work/graph
export PATH="$WRPATH/backend/scripts:$PATH"
export PATH="$WRPATH/datasci/scripts:$PATH"
export SOLENGPATH="$HOME/work/solutions-engineering"
# Set GOPATH to default work gopath
export GOPATH="$WRPATH/backend"

# Fix missing C headers for CGo on macOS 10.15
export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/"
export CGO_ENABLED=1
export CC=gcc

# Spark/Scala
export SPARK_HOME="$HOME/spark-2.4.4"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="$ZEPPELIN_HOME/bin:$PATH"
export PYSPARK_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/python"
export PYSPARK_DRIVER_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

function workenv() {
	echo "GOPATH is $GOPATH"
	cd $WRPATH/datasci
	source $WRPATH/datasci/scripts/datasci_env/bin/activate
}

function devstart() {
    workenv && cd ../backend
    scripts/devctl.sh start
}

function devstop() {
    workenv && cd ../backend
    scripts/devctl.sh stop
}

function devreboot() {
    workenv && cd ../backend
    scripts/devctl.sh stop
    make clean
    make install
    bash scripts/devctl.sh start
}

function clean_test() {
    workenv && cd ../backend
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
