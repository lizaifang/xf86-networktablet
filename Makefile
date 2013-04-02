
networktablet_drv.la : networktablet.lo
	libtool --mode=link gcc -module -o networktablet_drv.la -rpath /usr/lib64/xorg/modules/input networktablet.lo

networktablet.lo : networktablet.c
	libtool --mode=compile gcc -c `pkg-config --cflags xorg-server` networktablet.c


clean :
	rm -r  .libs  *.la *.lo *.o

install :
	install -m755 -d $(DESTDIR)/usr/lib64/xorg/modules/input
	libtool --mode=install install -c networktablet_drv.la "$(DESTDIR)/usr/lib64/xorg/modules/input"
