OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, '532084030360-85chimibb7nvvump4isosvqeladlajj3.apps.googleusercontent.com', 'HOh33jVH-oQRRKZOp350X0Ej', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  provider :google_oauth2, ENV['532084030360-85chimibb7nvvump4isosvqeladlajj3.apps.googleusercontent.com'], ENV['HOh33jVH-oQRRKZOp350X0Ej'], { scope: 'userinfo.email,userinfo.profile,https://www.google.com/m8/feeds', access_type: 'offline', approval_prompt: '', client_options: {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}} }
end
