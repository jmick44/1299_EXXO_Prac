Facter.add('nginx_version') do
  setcode "nginx -v 2>&1 | cut -d'/' -f2"
end
