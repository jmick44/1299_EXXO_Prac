Facter.add(:default_realm) do
  confine :kernel => 'Linux'
  setcode "/bin/awk '/default_realm/{print $NF}' /etc/krb5.conf"
end
