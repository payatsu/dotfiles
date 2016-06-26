set history save on
set history size 10000
set history filename ~/.gdb_history
set print array on
set print array-indexes on
set print asm-demangle on
set print demangle on
set print inferior-events on
set print pretty on
set print symbol-filename on
set print vtbl on
set python print-stack full

python
import sys
sys.path.insert(0, '/toolchains/share/gcc-5.3.0/python/')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
sys.path.insert(0, '/toolchains/share/gdb/python')
end
