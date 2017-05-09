Gem::Specification.new do |s|
  s.name = 'pinx'
  s.version = '0.1.0'
  s.summary = 'pinx'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.signing_key = '../privatekeys/pinx.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/pinx'
end
