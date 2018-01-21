Pod::Spec.new do |s|

  s.name          = 'ElementSelection'
  s.version       = '0.0.1'
  s.summary       = 'Element Selection.'
  s.homepage      = 'https://github.com/Arror/ElementSelection'
  s.license       = 'MIT'
  s.author        = { 'Arror' => 'hallo.maqiang@gmail.com' }
  s.platform      = :ios, '9.0'
  s.source        = { :git => 'https://github.com/Arror/ElementSelection.git', :tag => s.version }
  s.source_files  = 'Sources/**/*.swift'

end
