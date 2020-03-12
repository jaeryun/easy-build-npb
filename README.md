# easy-build-nas-pararrel-benchmark

## Dependency
MPI application인 NPB를 빌드하기 위한 MPI library 설치가 사전 요구됩니다.

## How to use
0. make.def 파일 내의 컴파일러 관련 설정을 수정 합니다.

1. `preinstall.sh`을 실행하여 빌드에 필요할 suite.def 파일을 제작합니다.  
(preinstall.sh 파일을 argument 없이 실행하면 아래 도움말을 확인하실 수 있습니다.)  

~~~
$ ./preinstall.sh
[ERROR] There should be one or more parameters:
Benchmark Classes(S, W, A, B, C, D, E, F)
  ex) ./preinstall B
  ex) ./preinstall A B C D
~~~

2. `build.sh`를 실행함으로써NPB를 다운로드 및  빌드를 수행할 수 있습니다.
(build.sh 파일을 argument 없이 실행하면 아래 도움말을 확인하실 수 있습니다.)

~~~
$ ./build.sh
[ERROR] It must requires one parameter:
         Path to be saved
  ex) ./build /root
  ex) ./build /home/user
~~~

3. (Optional) 빌드된 파일을 공유하려면 share.sh 파일 내의 `SAVED_PATH`, `NODES` 변수를 수정해주고 해당 파일을  실행함으로써 빌드된 파일들이 공유됩니다.
(share.sh 파일을 argument 없이 실행하면 아래 도움말을 확인하실 수 있습니다.)

~~~
$ ./share.sh
[ERROR] There should be two or more parameters:
         1. Path where NPB is stored
         2~n. hostnames to be shared
  ex) ./share.sh /root/NPB_bin vm1
  ex) ./share.sh /home/user vm1 vm2 vm3
~~~
