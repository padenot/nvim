if did_filetype()
  finish
endif
let lnum = 1
while lnum < 100
  if (getline(lnum) =~ 'ThreadSanitizerValgrind')
    setfiletype tsan
  endif
  set foldlevel=1
  let lnum = lnum + 1
endwhile

