setlocal makeprg=xcodebuild\ -alltargets\ -configuration\ Debug
setlocal errorformat=%f:%l:%c:%.%#\ error:\ %m,%f:%l:%c:%.%#\ warning:\ %m,%-G%.%#
