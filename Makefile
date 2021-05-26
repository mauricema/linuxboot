all: uroot linux sbl

.FORCE:

uroot: uroot/initramfs.cpio.xz

uroot/initramfs.cpio.xz: .FORCE
	echo Building u-root ...
	if [ ! -d 'uroot' ]; then \
		get github.com/u-root/u-root ; \
		mkdir -p  uroot ; \
	fi
	rm uroot/initramfs.* -Rf
	u-root -format=cpio -o uroot/initramfs.cpio
	xz --check=crc32 uroot/initramfs.cpio

linux: linux/arch/x86/boot/bzImage

linux/arch/x86/boot/bzImage: .FORCE
	if [ ! -d 'linux' ]; then \
		echo "Cloning linux kernel ..."; \
		git clone --depth 1 --branch v5.11  https://github.com/torvalds/linux.git linux ; \
	fi	
	echo Checking out linux kernel ...
	cd  ./linux; \
	git checkout v5.11 -f; \
	echo "Compiling kernel ..."; \
	cp ../misc/mini_config .config ; \
	make ARCH=x86_64 "KCFLAGS=-mno-movbe" bzImage -j 8 ; \
	cd ..

sbl: sbl/Outputs/qemu/SlimBootloader.bin

sbl/Outputs/qemu/SlimBootloader.bin: .FORCE
	if [ ! -d 'sbl' ]; then \
		echo "Cloning Slim Bootloader ..."; \
		git clone https://github.com/slimbootloader/slimbootloader.git sbl ; \
	fi
	echo "Building Slim Bootloader ..."
	cd sbl && git checkout 6275eb6eb7d841e2baee041ba38c3f04186475d0 -f
	cd sbl && git am --ignore-space-change ../misc/0001-Enable-LinuxBoot-for-QEMU.patch
	mkdir -p sbl/PayloadPkg/PayloadBins
	cp misc/config.cfg sbl/PayloadPkg/PayloadBins/config.cfg 
	cp linux/arch/x86/boot/bzImage sbl/PayloadPkg/PayloadBins/vmlinuz 
	cp uroot/initramfs.cpio.xz sbl/PayloadPkg/PayloadBins/initrd 
	cd sbl && python BuildLoader.py build qemu -k -p "config.cfg:OSLD;vmlinuz:LINX;config.cfg:CMDL;initrd:INRD"

run: .FORCE
	qemu-system-x86_64 -cpu qemu64,+movbe -machine q35,max-fw-size=16777216 -m 256 -serial mon:stdio -boot order=d -nographic -pflash sbl/Outputs/qemu/SlimBootloader.bin

