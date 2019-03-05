# Include all Ubuntu CIS rules, this manages OS versions
class cis::ubuntu {
  if $facts['os']['name'] == 'Ubuntu' {
    case $facts['os']['release']['full'] {
      '16.04': { include cis::ubuntu::xenial }
      default: { notify("Unsupported version of Ubuntu ${facts['os']['release']['full']}") }
    }
  }
}
