sy match TS_Head              /Possible data race during.*:/
sy match TS_Concurrent        /Concurrent .* happened at or after these points:/
sy match TS_MemoryDescr       /Address .* is .* bytes inside data symbol.*/
sy match TS_MemoryDescr       /Location .* bytes inside a block starting at .* of size .* allocated.*/
sy match TS_Locks             /Locks involved in this report.*/
sy match TS_Fold              /{{{/
sy match TS_Fold              /}}}/
sy match TS_FirstFunc         /#0  0x[0-9A-F]\+: .*/
hi TS_Head          ctermfg=Red
hi TS_Concurrent    ctermfg=Magenta
hi TS_MemoryDescr   ctermfg=Cyan
hi TS_Locks         ctermfg=Green
hi TS_Fold          cterm=bold
hi TS_FirstFunc     cterm=bold
" vim: fdl=1

