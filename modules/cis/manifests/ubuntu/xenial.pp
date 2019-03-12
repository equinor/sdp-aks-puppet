# Include all Ubuntu CIS 16.04 (Xenial)
class cis::ubuntu::xenial {
  $files = [ 's1', 's2', 's4', 's6' ]
  $files.each |$file| { include "cis::ubuntu::xenial::${file}" }
}
