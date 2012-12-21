apt_repository "hiphop-php" do
  uri "http://dl.hiphop-php.com/ubuntu"
  components ["precise", "main"]
end

package "hiphop-php" do
  options "--force-yes"
end
