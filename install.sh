virtualenv venv --python=python3.7
source venv/bin/activate

alpine="$(grep -c vanilla <<"$(uname -r)")"

if [[ $alpine -eq 1 ]]
then
	apk add --no-cache mariadb-connector-c-dev
	apk add lapack
	apk add cython
	apk add py3-numpy
	apk add lapack-dev
	apk add blas-dev
	apk add py3-scipy
	apk add libxml2-dev libxslt-dev
	apk add gfortran
	wget https://github.com/xianyi/OpenBLAS/archive/v0.3.6.tar.gz \
	&& tar -xf v0.3.6.tar.gz \
	&& cd OpenBLAS-0.3.6/ \
	&& make BINARY=64 FC=$(which gfortran) USE_THREAD=1 \
	&& make PREFIX=/usr/lib/openblas install
else
	sudo apt install libmariadbclient-dev
fi


python setup.py install
