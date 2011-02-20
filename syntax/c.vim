" Highlight Class and Function names
syn match cCustomParen "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope


hi def link cCustomFunc  Function
hi def link cCustomClass Function

hi cCustomClass gui=bold guifg=#00FF00
hi cCustomFunc  gui=bold guifg=#66CC66

