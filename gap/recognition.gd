#############################################################################
##
##  recognition.gd        recogbase package
##                                                        Max Neunhoeffer
##                                                            Ákos Seress
##
##  Copyright 2005-2008 by the authors
##  This file is free software, see license information at the end.
##
##  Declaration stuff for generic recognition.
##
#############################################################################

# The category:
DeclareCategory( "IsRecognitionInfo", IsObject );
# The type:
DeclareGlobalVariable( "RecognitionInfoType" );
# The family:
BindGlobal( "RecognitionInfoFamily",
  NewFamily("RecognitionInfoFamily", IsRecognitionInfo));


# The info class:
DeclareInfoClass( "InfoRecog" );
SetInfoLevel(InfoRecog,1);

# A place for package-local functions:
BindGlobal( "RECOG", rec() );

# Some properties and attributes of the recognition infos:
DeclareFilter( "IsLeaf" );
DeclareFilter( "IsReady" );
DeclareAttribute( "group", IsRecognitionInfo, "mutable" );
DeclareAttribute( "homom", IsRecognitionInfo, "mutable" );
DeclareAttribute( "nicegens", IsRecognitionInfo, "mutable" );
DeclareAttribute( "pregensfac", IsRecognitionInfo, "mutable" );
DeclareAttribute( "calcnicegens", IsRecognitionInfo, "mutable" );
DeclareAttribute( "slptonice", IsRecognitionInfo, "mutable" );
DeclareAttribute( "factor", IsRecognitionInfo, "mutable" );
DeclareAttribute( "kernel", IsRecognitionInfo, "mutable" );
DeclareAttribute( "parent", IsRecognitionInfo, "mutable" );
DeclareAttribute( "fhmethsel", IsRecognitionInfo, "mutable" );
DeclareAttribute( "presentation", IsRecognitionInfo, "mutable" );
DeclareAttribute( "methodsforfactor", IsRecognitionInfo, "mutable" );
DeclareAttribute( "slpforelement", IsRecognitionInfo, "mutable" );
# Here we collect generators of the kernel:
DeclareAttribute( "gensN", IsRecognitionInfo, "mutable" );
# The following holds a method, described by a record, to find generators
# of the kernel:
DeclareAttribute( "findgensNmeth", IsRecognitionInfo, "mutable" );
# Here is one slp to make all the gensN:
DeclareAttribute( "gensNslp", IsRecognitionInfo, "mutable" );
# Do we have to do an immediate verification of the kernel?
DeclareAttribute( "immediateverification", IsRecognitionInfo, "mutable" );
# Used to transport information about the group down to the kernel:
DeclareAttribute( "forkernel", IsRecognitionInfo, "mutable" );
# Used to transport information about the group down to the factor:
DeclareAttribute( "forfactor", IsRecognitionInfo, "mutable" );
# Used to check whether group elements are equal to one after recognition:
DeclareAttribute( "isone", IsRecognitionInfo, "mutable" );
# Used to compare group elements after recognition:
DeclareAttribute( "isequal", IsRecognitionInfo, "mutable" );



#############################################################################
# Some variables to hold databases of methods and such things:
#############################################################################

DeclareGlobalVariable( "FindHomMethodsPerm" );
DeclareGlobalVariable( "SLPforElementFuncsPerm" );
DeclareGlobalVariable( "FindHomDbPerm" );

DeclareGlobalVariable( "FindHomMethodsMatrix" );
DeclareGlobalVariable( "SLPforElementFuncsMatrix" );
DeclareGlobalVariable( "FindHomDbMatrix" );

DeclareGlobalVariable( "FindHomMethodsProjective" );
DeclareGlobalVariable( "SLPforElementFuncsProjective" );
DeclareGlobalVariable( "FindHomDbProjective" );

DeclareGlobalVariable( "FindHomMethodsBB" );
DeclareGlobalVariable( "SLPforElementFuncsBB" );
DeclareGlobalVariable( "FindHomDbBB" );


# Our global functions for the main recursion:

DeclareGlobalFunction( "RecognisePermGroup" );
DeclareSynonym("RecognizePermGroup", RecognisePermGroup);
DeclareGlobalFunction( "RecogniseMatrixGroup" );
DeclareSynonym("RecognizeMatrixGroup", RecogniseMatrixGroup);
DeclareGlobalFunction( "RecogniseProjectiveGroup" );
DeclareSynonym("RecognizeProjectiveGroup", RecogniseProjectiveGroup);
DeclareGlobalFunction( "RecogniseBBGroup" );
DeclareSynonym("RecognizeBBGroup", RecogniseBBGroup);
DeclareGlobalFunction( "RecogniseGroup" );
DeclareSynonym("RecognizeGroup", RecogniseGroup);
DeclareGlobalFunction( "RecogniseGeneric" );
DeclareSynonym("RecognizeGeneric", RecogniseGeneric);


# Helper functions for the generic part:

DeclareGlobalFunction( "CalcNiceGens" );
DeclareGlobalFunction( "CalcNiceGensGeneric" );
DeclareGlobalFunction( "CalcNiceGensHomNode" );
DeclareGlobalFunction( "SLPforElementGeneric" );
DeclareGlobalFunction( "SLPforElement" );
DeclareGlobalFunction( "RandomSubproduct" );
DeclareGlobalFunction( "FastNormalClosure" );
DeclareGlobalFunction( "FindKernelFastNormalClosure" );
DeclareGlobalFunction( "FindKernelRandom" );
DeclareGlobalFunction( "FindKernelDoNothing" );
DeclareGlobalFunction( "FindKernelLowerLeftPGroup" ); # defined in matrix.gi


# Finally the generic verification procedure:

DeclareGlobalFunction( "VerifyPermGroup" );
DeclareGlobalFunction( "VerifyMatrixGroup" );
DeclareGlobalFunction( "VerifyProjectiveGroup" );
DeclareGlobalFunction( "VerifyBBGroup" );
DeclareGlobalFunction( "VerifyGroup" );

# Some more user functions:

DeclareGlobalFunction( "DisplayCompositionFactors" );

##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

