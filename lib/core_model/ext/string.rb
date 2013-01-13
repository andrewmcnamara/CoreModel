module CoreModel
  # This module contains simplified version of the `camelize` and
  # `underscore` methods from ActiveSupport, since these are such
  # common operations when dealing with the Cocoa API.
  module String

    # Convert 'snake_case' into 'CamelCase'
    def camelize(uppercase_first_letter = true)
      string = self.dup
      string.gsub!(/(?:_|(\/))([a-z\d]*)/i) do
        new_word = $2.downcase
        new_word[0] = new_word[0].upcase
        new_word = "/#{new_word}" if $1 == '/'
        new_word
      end
      if uppercase_first_letter && uppercase_first_letter != :lower
        string[0] = string[0].upcase
      else
        string[0] = string[0].downcase
      end
      string.gsub!('/', '::')
      string
    end
  end
end

String.send(:include, CoreModel::String)