require 'serverspec'

describe command('sbt --version') do
  its(:stdout) { should match "sbt launcher version" }
end
