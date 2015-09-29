#install java default (1.8 for now)
yum_package 'java-1.8.0-openjdk-devel' do
	options "-y"
end