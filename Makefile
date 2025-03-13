USE_DPDK ?= 0
ifeq ($(USE_DPDK), 1)
    DPDK_FLAGS := -DPCAPPP_USE_DPDK=ON
else
    DPDK_FLAGS := -DPCAPPP_USE_DPDK=OFF
endif

all:		build

run-cmake:	
	cmake -DBUILD_SHARED_LIBS=ON $(DPDK_FLAGS) -DLIGHT_PCAPNG_ZSTD=ON -S . -B build

build:		run-cmake
	cmake --build build -- -j $(nproc)

install:	build
	cmake --install build

clean:
	$(RM) -r build
