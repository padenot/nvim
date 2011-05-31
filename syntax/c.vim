" Highlight Class and Function names
syn match cCustomParen "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
" For the mozilla codebase
syn keyword moz_int_types   PRInt8 PRInt16 PRInt32 PRInt64 PRUint8 PRUint16 PRUint32 PRUint64
syn keyword  moz_types       PRBool PRSize PROffset32 PROffset64 PRUptrdiff PRUnichar PRPackedBool
syn keyword  moz_boolean     PR_TRUE PR_FALSE
syn keyword  moz_constants   nsnull


hi def link cCustomFunc  Function
hi def link cCustomClass Function
hi def link moz_types Type
hi def link moz_int_types Type
hi def link moz_boolean Constant
hi def link moz_constants Constant

hi cCustomClass gui=bold guifg=#00FF00
hi cCustomFunc  gui=bold guifg=#66CC66

