OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '532084030360-85chimibb7nvvump4isosvqeladlajj3.apps.googleusercontent.com', 'HOh33jVH-oQRRKZOp350X0Ej', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
