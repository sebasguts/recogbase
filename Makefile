GAPPATH = ../..
#
# makefile for the recogbase package                         Max Neunhoeffer
#
##  Copyright (C) 2009  Akos Seress and Max Neunhoeffer
##  This file is free software, see license information at the end.
#
default: doc

doc: doc/manual.six

doc/manual.six: doc/methsel.xml doc/intro.xml doc/install.xml VERSION \
		doc/recognition.xml doc/afterrecog.xml doc/recogbase.xml
	($(GAPPATH)/bin/gap.sh makedoc.g)

clean:
	(cd doc ; ./clean)

archive: doc
	(cd .. ; tar czvf recogbase-`cat recogbase/VERSION`.tar.gz --exclude ".svn" --exclude .git --exclude obsolete --exclude NOTES recogbase)

WEBPOS=/scratch/neunhoef/mywebpage.pub/Computer/Software/Gap/recogbase

towww: archive
	echo '<?xml version="1.0" encoding="ISO-8859-1"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.recogbase
	cp doc/manual.pdf ${WEBPOS}/recogbase.pdf
	cp ../recogbase-`cat VERSION`.tar.gz ${WEBPOS}
	@echo
	@echo Now please adjust the archive link in 
	@echo "    " ${WEBPOS}.mixer !

##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; version 3 of the License.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program; if not, write to the Free Software
##  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
##

