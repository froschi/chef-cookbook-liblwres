packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libcap"
  include_recipe "libxml2"

  packages |= %w/
    liblwres60
  /
when "precise"
  packages |= %w/
    liblwres80
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
