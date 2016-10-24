require 'spec_helper'
require 'tempfile'

describe Djvu do
  it 'has a version number' do
    expect(Djvu::VERSION).not_to be nil
  end

  context '#ddjvu' do
    it 'should export file' do
      file = Tempfile.new
      Djvu.file(File.expand_path('spec/fixtures/Alice_in_Wonderland.djvu')).ddjvu(format: 'ppm', page: 1, output_file: file.path)
      fail('File is empty') if file.size === 0
    end
  end

  context '#djvutxt' do
    it 'should export text layer' do
      file = Tempfile.new
      Djvu.file(File.expand_path('spec/fixtures/Alice_in_Wonderland.djvu')).djvutxt(page: 8, output_file: file.path)
      fail('File is empty') if file.size === 0
    end
  end

  context '#djvudump' do
    it 'should export text layer' do
      file = Tempfile.new
      Djvu.file(File.expand_path('spec/fixtures/Alice_in_Wonderland.djvu')).djvudump(o: file.path)
      puts file.read
      fail('File is empty') if file.size === 0
    end
  end
end
