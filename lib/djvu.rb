require 'djvu/version'
require 'open3'

module Djvu

  # Default exception class for Djvu.
  class Exception < ::StandardError
  end

  # Exception that is raised if no output file.
  class OutputFileNotFound < Djvu::Exception
  end

  # Can't process page.
  class UnprocessablePage < Djvu::Exception
  end

  def self.file(djvufile)
    Djvu::File.new(djvufile)
  end

  class File
    def initialize(djvufile)
      @djvufile = djvufile
      self
    end

    def ddjvu(options)
      raise OutputFileNotFound unless options[:output_file]

      result, status = Open3.capture2e('ddjvu ' + [parse_options(options), @djvufile, options[:output_file]].join(' '))

      status.success? || raise(UnprocessablePage, result)
    end

    def djvutxt(options)
      raise OutputFileNotFound unless options[:output_file]

      result, status = Open3.capture2e('djvutxt ' + [parse_options(options), @djvufile, options[:output_file]].join(' '))

      status.success? || raise(UnprocessablePage, result)
    end

    def djvudump(options)
      result, status = Open3.capture2e('djvudump ' + [parse_options(options), @djvufile].join(' '))

      status.success? || raise(UnprocessablePage, result)
    end

    private

    def parse_options(options)
      command = []
      options.each do |key, val|
        next if key === :output_file
        command << "-#{key}=#{val}"
      end
      command.join(' ')
    end
  end
end
