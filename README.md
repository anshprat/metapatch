This package is only for building a no-op package to be used only for testing
automated patching.
This package will follow the semantic versioning with date filing in as
MAJOR.MINOR.PATCH
ie
YYYY.MMDD.HHMMSS as the SemVer for this package.

Package build using

https://stackoverflow.com/questions/880227/what-is-the-minimum-i-have-to-do-to-create-an-rpm-file

To build the package, run inside the repo

docker build -f Dockerfile .

TODO: S3 upload is pending. simple change in buildrpm.sh
