Gem::Specification.new do |s|
  s.name = 'pinx'
  s.version = '0.1.1'
  s.summary = 'A base class for setting a digital pin to on, off, or blink, or on, off, or blinkg for a fixed duration.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/pinx.rb']
  s.signing_key = '../privatekeys/pinx.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/pinx'
end
