# redports release Makefile

VERSION=1.0.90
MODULES=LICENSE README redports-trac rpdd rptinderbox scripts

all:	clean

clean:
	cd redports-trac && make clean
	cd rpdd && make clean
	rm -rf out/

release: clean
	mkdir -p out/redports-${VERSION}/
	cp -pR ${MODULES} out/redports-${VERSION}/
	chown -R root:wheel out/redports-${VERSION}/
	cd out/ && tar -cjf redports-${VERSION}.tar.bz2 redports-${VERSION}
	cd out/ && md5 redports-${VERSION}.tar.bz2 > redports-${VERSION}.tar.bz2.md5
	cd out/ && sha256 redports-${VERSION}.tar.bz2 > redports-${VERSION}.tar.bz2.sha256

