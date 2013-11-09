cmd_drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o := arm-openwrt-linux-uclibcgnueabi-gcc -Wp,-MD,drivers/net/hnd/r6250/hnd/../src/shared/.nvramstubs.o.d  -nostdinc -isystem /home/james/openwrt/staging_dir/toolchain-arm_cortex-a9+vfp_gcc-4.6-linaro_uClibc-0.9.33.2_eabi/lib/gcc/arm-openwrt-linux-uclibcgnueabi/4.6.4/include -I/home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/include/uapi -Iinclude/generated/uapi -include /home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -fno-reorder-blocks -fno-tree-ch -fno-caller-saves -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -femit-struct-debug-baseonly -fno-var-tracking -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DBCM5354 -DLINUX_HYBRID_POSTPROCESSING_REMOVAL -I../src/include   -ffunction-sections -fdata-sections  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(nvramstubs)"  -D"KBUILD_MODNAME=KBUILD_STR(hnd)" -c -o drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.c

source_drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o := drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.c

deps_drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o := \
  include/bcm_cfg.h \
  include/typedefs.h \
  include/generated/uapi/linux/version.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/uapi/linux/types.h \
  arch/arm/include/generated/asm/types.h \
  /home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/include/uapi/asm-generic/types.h \
  include/asm-generic/int-ll64.h \
  include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/uapi/asm-generic/bitsperlong.h \
  /home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/include/uapi/linux/posix_types.h \
  include/linux/stddef.h \
  include/uapi/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/arch/arm/include/uapi/asm/posix_types.h \
  /home/james/openwrt/build_dir/target-arm_cortex-a9+vfp_uClibc-0.9.33.2_eabi/linux-bcm53xx/linux-3.10.18/include/uapi/asm-generic/posix_types.h \
  include/bcmdefs.h \
  include/bcmutils.h \
  include/bcmnvram.h \
    $(wildcard include/config/failsafe/upgrade.h) \
    $(wildcard include/config/failsafe/upgrade/support//.h) \
    $(wildcard include/config/dual/image.h) \
    $(wildcard include/config/dual/image/flash/support//.h) \

drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o: $(deps_drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o)

$(deps_drivers/net/hnd/r6250/hnd/../src/shared/nvramstubs.o):
