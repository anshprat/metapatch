MAJOR=`date +%Y`
MINOR=`date +%m%d|sed -e 's/^0//'`
PATCH=`date +%H%M%S|sed -e 's/^0//'`
VER="${MAJOR}.${MINOR}.${PATCH}"
LOCAL_REPO="/mnt/local_repo"
RPM_DEST=${LOCAL_REPO}/package/${MAJOR}/${MINOR}
export changelogdate=`date "+%a %b %d %Y"`
export VERSION=${VER}
rpmdev-setuptree
cp metapatch.spec rpmbuild/SPECS
mkdir -p metapatch-${VER}
install -m 755 metapatch.sh metapatch-${VER}/
tar -czvf rpmbuild/SOURCES/metapatch-${VER}.tar.gz metapatch-${VER}/
rm -rf metapatch-${VER}
cd rpmbuild
rpmbuild -ba --define "version ${VER}" --define "changelogdate ${changelogdate}" SPECS/metapatch.spec
mkdir -p ${RPM_DEST}
cp /root/rpmbuild/RPMS/noarch/* ${RPM_DEST}
cd ${LOCAL_REPO}
createrepo --database ${LOCAL_REPO}
#aws s3 sync $LOCAL_REPO/ s3://${S3_YUM_REPO}
