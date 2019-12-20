virtualenv venv --python=python3.7
source venv/bin/activate

alpine="$(grep -c vanilla <<"$(uname -r)")"

if [[ $alpine -eq 1 ]]
then
	apk add --no-cache mariadb-connector-c-dev
else
	sudo apt install libmariadbclient-dev
fi


python setup.py install
