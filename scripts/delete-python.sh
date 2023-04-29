#! /usr/bin/zsh
prefix='/usr/local/'
pyver='3.10'

rm -rfI \
    $HOME/.local/lib/python${pyver} \
    ${prefix}bin/python${pyver} \
    ${prefix}bin/python${pyver}-config \
    ${prefix}bin/pip${pyver} \
    ${prefix}bin/2to3-${pyver} \
    ${prefix}bin/idle${pyver} \
    ${prefix}bin/pydoc${pyver} \
    ${prefix}lib/libpython${pyver}.a \
    ${prefix}lib/python${pyver} \
    ${prefix}lib/pkgconfig/python-${pyver}.pc \
    ${prefix}lib/pkgconfig/python-${pyver}-embed.pc \
    ${prefix}include/python${pyver}
    ${prefix}share/man/man1/python${pyver}.1 \



# ${prefix}lib/libpython${pyver}m.a \
# ${prefix}bin/pyvenv-${pyver} \
# ${prefix}bin/include/python${pyver} \
# ${prefix}bin/python${pyver}m \
# ${prefix}bin/python${pyver}m-config \
