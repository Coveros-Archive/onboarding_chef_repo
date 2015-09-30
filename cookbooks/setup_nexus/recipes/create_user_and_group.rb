group 'nexususers' do
  append true
end

user 'nexusguy' do
  comment 'User for running Nexus OSS'
  home '/home/nexusguy'
  shell '/bin/bash'
end