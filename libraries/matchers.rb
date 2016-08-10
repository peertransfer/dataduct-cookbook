if defined?(ChefSpec)
  def install_dataduct(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dataduct, :install, resource_name)
  end

  def create_dataduct_config(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dataduct_config, :create, resource_name)
  end
end
