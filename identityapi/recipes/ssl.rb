template "/etc/apache2/ssl/cert.crt" do
    mode 0600
    source 'ssl.key.erb'
    variables :key => deploy[:ssl_certificate]
    end

template "/etc/apache2/ssl/key.key" do
    mode 0600
    source 'ssl.key.erb'
    variables :key => deploy[:ssl_certificate_key]
    end

template "/etc/apache2/ssl/caauth.ca" do
    mode 0600
    source 'ssl.key.erb'
    variables :key => deploy[:ssl_certificate_ca]
    end
