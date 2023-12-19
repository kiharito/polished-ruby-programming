class Foo
  class << self
    private

    def bar
      :baz
    end

    alias baz bar
    remove_method :bar
  end
end

class Foo
  def self.bar
    :baz
  end

  private_class_method :bar

  singleton_class.alias_method :baz, :bar
  singleton_class.remove_method :bar
end
