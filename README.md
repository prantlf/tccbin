# tccbin

This is a prebuild tcc (git://repo.or.cz/tinycc.git) for the platform `linux-i386`, cut at commit 12acbf3.

See the build with Docker in [Makefile](./Makefile). <br>
See the preparation of the environment in [Dockerfile](./Dockerfile). <br>
See the commands for building the compiler in [build.sh](./build.sh).

## Upgrade

Make sure that you have `docker buildx` ready and run `make`:

    make

Locate the line with the commit hash identifying the build, here `12acbf3`:

    tcc version 0.9.28rc 2024-08-20 mob@12acbf3 (i386 Linux)

Write the commit hash to `README.md` and commit it with the modified files:

    git add README.md tcc.exe include lib share
    git commit -m 'New thirdparty-linux-i386 tcc.exe, cut at 12acbf3'

## Local Build

Run the following commands on Debian i386:

    apt-get install binutils gcc git libc-dev make texinfo
    mkdir tinycc
    cd tinycc
    ../clone.sh
    cp ../build.sh .
    ./build.sh

The build output will be placed to `thirdparty/tcc`.
