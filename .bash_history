sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y ocaml m4 llvm opam
dpkg -l llvm
opam init
ocamlfind
opam install llvm.3.6 ocamlfind
ls
wget http://www.cs.columbia.edu/~sedwards/classes/2016/4115-spring/microc-llvm.tar.gz
tar zxf microc-llvm.tar.gz
cd microc-llvm
make
ocamlfind
eval `opam config env`
make
./testall.sh
sudo poweroff
sudo apt-get autoclean
sudo apt-get clean
df -h
du -sh /var/cache/apt/archives
du -sh /var
ls
cd microc-llvm/
ls
make clean
make
./testall.sh
sudo poweroff
ls
cd microc-llvm/
ls
cd tests/
ls
vim test-add1.mc 
sudo apt-get install vim
vim test-add1.mc 
cp test-add1.mc helloworld.mc
vim helloworld.mc 
vim ../testall.sh
cd ..
cd tests/
ls
vim test-add1.out 
vim helloworld.mc 
vim helloworld.out
ls
cd ..
ls
./testall.sh tests/helloworld.mc
./testall.sh -v
ls
cd test
ls
cd tests/
ls
vim test-hello.mc
mv helloworld.mc test-helloworld.mc
mv helloworld.out test-helloworld.out
cd ..
ls
./testall.sh 
ls
sudo vim test-helloworld.ll 
cd tests/
ls
cd ..
ls
cd _build/
ls
cd ..
ls
vim microc.native 
ls
vim testall.log 
vim tests/test-helloworld.mc
./testall.sh 
ls
cd _build/
ls
cd ..
vim testall.sh
./testall.sh -k tests/test-helloworld.mc
ls
vim tests/test-helloworld.mc
vim tests/test-helloworld.out 
./testall.sh -k tests/test-helloworld.mc
ls
vim testall.log
ls
vim codegen.ml 
ls
exit
ls
cd microc-llvm/
ls
vim ast.ml 
ls
cd microc-llvm/
ls
vim scanner.mll 
rm .codegen.ml.sw*
rm .parser.mly.swp 
ls
ls -l
ls -a
./testall.sh tests/test-helloworld.mc
cat testall.log
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
ls
cd microc-llvm/
make
./testall.sh tests/test-helloworld.mc
ls
cat testall.log
cat test-helloworld.diff
vim tests/test-helloworld.out
./testall.sh tests/test-helloworld.mc
cat test-helloworld.diff
vim codegen.ml 
make
./testall.sh tests/test-helloworld.mc
cat test-helloworld.diff
cat test-helloworld.ll 
vim codegen.ml 
make
./testall.sh tests/test-helloworld.mc 
cat test-helloworld.out
cat test-helloworld.ll
vim codegen.ml 
make
vim codegen.ml 
ls
cd microc-llvm/
ls
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
ls
cd microc-llvm/
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
./testall.sh tests/test-helloworld.mc
cat test-helloworld.ll
ls
cat test-helloworld.diff
cat test-helloworld.out
vim codegen.ml 
vim ast.ml 
vim parser.mly 
vim scanner.mll 
ls
vim semant.ml 
./testall.sh 
vim testall.log 
vim test
vim testall.log
ls
cat test-hello.out
cat test-if4.out 
vim codegen.ml 
make
./testall.sh 
vim testall.log 
ls
vim test-helloworld.ll 
cd microc-llvm/
ls
touch hellworld.c
vim hellworld.c 
clang -c hellworld.c -emit-llvm
sudo apt-get install clang
clang -c hellworld.c -emit-llvm
llvm-dis hellworld.bc 
cat hellworld.ll 
cat test-helloworld.ll 
ls
cd microc-llvm/
ls
cat test-helloworld.out
cat test-helloworld.ll
cat hellworld.ll
lli hellworld.ll
lli test-helloworld.ll
vim codegen.ml 
make
./testall.sh 
cat test-if1.out
cat test-if1.ll
cat test-hello.ll
cat test-helloworld.ll
vim codegen.ml 
make
./testall.sh 
lli test-helloworld.ll
cat test-helloworld.ll
cat test-hello.ll
cat test-hello.out
vim codegen.ml 
make
vim codegen.ml 
make
./testall.sh 
cat test-hello.out 
cat test-helloworld.out
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
./testall.sh 
cat test-helloworld.out
vim codegen.ml 
ls
cd microc-llvm/
ls
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
amek
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
make
./testall.sh 
cat test-helloworld.out
vim codegen.ml 
make
./testall.sh 
vim codegen.ml 
cat test-helloworld.ll
cat test-hello.ll
cat hellworld.ll
vim codegen.ml 
make
./testall.sh 
cat test-helloworld.out
cat tests/test-helloworld.out
vim tests/test-helloworld.out
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
ls
cd microc-llvm/
ls
vim ast.ml 
vim codegen.ml 
vim ast.ml 
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
vim ast.ml 
ls
cd microc-llvm/
ls
vim codegen.ml 
make
vim codegen.ml 
make
vim codegen.ml 
vim semant.ml 
make
./testall.sh 
cat test-helloworld.out
cat test-helloworld.ll 
vim codegen.ml 
make
./testall.sh 
cat test-helloworld.lli
cat test-helloworld.ll
cat testall.log
ls
cat test-helloworld.out
vim codegen.ml 
make
./testall.sh 
cat test-helloworld.out
vim tests/test-helloworld.mc
./testall.sh tests/test-helloworld.mc
cat test-helloworld.out
cd microc-llvm
ls
cd ..
ls
mv microc-llvm bmwsa
ls
cd bmwsa/
make
ls
cd ..
mv bmwsa microc-llvm
ls
cd microc-llvm/
make
./testall.sh 
vim tests/test-helloworld.mc 
vim tests/test-helloworld.out
vim tests/test-helloworld.mc 
make
./testall.sh 
ls
cd ..
ls
rm microc-llvm.tar.gz 
ls
cd microc-llvm/
ls
vim Makefile 
make
ls
vim Makefile 
ls -l
cd _build/
l
ls -l
cd ..
ls
ls -l
cd ..
ls
git init
git pull https://github.com/amanchahar/PLT-Data-Processing-Langauge.git
ls
git add .
git status
git commit -m "Hello World" 
git config --global user.email "amaniiitd@gmail.com"
git config --global user.name "amanchahar"
ls
git commit -m "Hello World" 
git push 
ls
git push
git push master
git config --global push.default simple
git push
git push master
git push --set-upstream master master
git 
git status
git add .
git status
ls
git pull https://github.com/amanchahar/PLT-Data-Processing-Langauge.git
git status
git add microc-llvm/
ls
git status
git commit -m "Hello World"
git push HEAD
git push --set-upstream HEAD master
