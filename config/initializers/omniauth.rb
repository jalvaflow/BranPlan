Rails.application.config.middleware.use OmniAuth::Builder do

  provider OmniAuth::Strategies::GoogleOauth2,
  '532084030360-85chimibb7nvvump4isosvqeladlajj3.apps.googleusercontent.com',
  'HOh33jVH-oQRRKZOp350X0Ej', scope: 'profile', image_aspect_ratio: 'square',
  image_size: 48, access_type: 'online', name: 'google'

end
