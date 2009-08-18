ActionView::Base.send :include, WeeBeastie::AuthenticationSystem
ActionController::Base.send :include, WeeBeastie::AuthenticationSystem


# Include your application configuration below
# @WBH@ would be nice for this to not be necessary somehow...
# PASSWORD_SALT = '48e45be7d489cbb0ab582d26e2168621' unless Object.const_defined?(:PASSWORD_SALT)
Module.class_eval do
  def expiring_attr_reader(method_name, value)
    class_eval(<<-EOS, __FILE__, __LINE__)
      def #{method_name}
        class << self; attr_reader :#{method_name}; end
        @#{method_name} = eval(%(#{value}))
      end
    EOS
  end
end

