require 'djvu/version'
require 'open3'

module Djvu

  # Default exception class for Djvu.
  class Exception < ::StandardError
  end

  # Exception that is raised if no input file.
  class InputFileNotFound < Djvu::Exception
  end

  # Exception that is raised if no output file.
  class OutputFileNotFound < Djvu::Exception
  end

  # Can't process page.
  class UnprocessablePage < Djvu::Exception
  end

  # Can't process page.
  class MissingRequiredArgument < Djvu::Exception
  end

  def self.file(djvufile)
    Djvu::Tools.new(djvufile)
  end

  class Tools
    def initialize(djvufile)
      @djvufile = djvufile
      self
    end

    def ddjvu(options)
      raise(MissingRequiredArgument, '-format is required') unless options[:format]

      command = []
      command << 'ddjvu'
      command << parse_options(options)
      command << @djvufile
      command << options[:output_file] if options[:output_file]

      result, status = Open3.capture2e(command.join(' '))

      status.success? || raise(UnprocessablePage, result)
    end

    def djvutxt(options = false)
      command = []
      command << 'djvutxt'
      command << parse_options(options, '--%s=%s') if options
      command << @djvufile
      command << options[:output_file] if options && options[:output_file]

      result, status = Open3.capture2e(command.join(' '))

      status.success? || raise(UnprocessablePage, result)

      result
    end

    def djvudump(options = false)
      command = []
      command << 'djvudump'
      command << parse_options(options, '-%s %s') if options
      command << @djvufile

      result, status = Open3.capture2e(command.join(' '))

      status.success? || raise(UnprocessablePage, result)

      result unless options && options[:o]
    end

    def djvused(options = false)
      command = []
      command << 'djvused'
      command << parse_options(options, "-%s '%s'") if options
      command << @djvufile

      result, status = Open3.capture2e(command.join(' '))

      status.success? || raise(UnprocessablePage, result)

      result
    end

    private

    def parse_options(options, pattern = '-%s=%s')
      command = []
      options.each do |key, val|
        next if key === :output_file
        if val === true
          command << "-#{key}"
        else
          command << pattern % [key, val]
        end
      end
      command.join(' ')
    end
  end
end
