#Parallel functional programming in Haskell
###This repository present usage of "Control.Parallel" Haskell library with the solve [KöMaL S.141. problem](https://www.komal.hu/feladat?a=feladat&f=S141&l=hu).
I already solved this exercise in C++ an another repo, see:
[https://github.com/ProgrammerGnome/Problem-S.141](https://github.com/ProgrammerGnome/Problem-S.141) .

####[FILE] Main.hs:
This code is for KöMaL S.141.

####[FILE] basic-exercises:
Presented elementary exercises (for example: "loops", IO monad) in one functional programming languages. This file content -not one- more runnable program. They can be run separately!

##For the run following this steps (ArchLinux):

	sudo pacman -S cabal-install
	cabal install parallel
	
	ghc -o HSProgram Main.hs
	./HSProgram