all:		build

run-cmake:	
	cmake -DBUILD_SHARED_LIBS=ON -S . -B build

build:		run-cmake
	cmake --build build -- -j $(nproc)

install:	build
	cmake --install build

clean:
	$(RM) -r build
