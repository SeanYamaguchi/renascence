module ActiveSupport
  class SafeBuffer < String
    def concat(value)
      if value.html_safe?
        super(value.force_encoding('utf-8'))
      else
        super(ERB::Util.h(value.force_encoding('utf-8')))
      end
    end
  end
end

=begin
/Users/Sean/Desktop/今後処理/psara-institute/vendor/bundler/ruby/2.1.0/gems/spring-1.3.3/lib/spring/application.rb:247:in `start_with?': incompatible character encodings: ASCII-8BIT and UTF-8 (Encoding::CompatibilityError)
To stop this error
=end