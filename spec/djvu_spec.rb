require 'spec_helper'
require 'tempfile'

describe Djvu do
  it 'has a version number' do
    expect(Djvu::VERSION).not_to be nil
  end

  context '#ddjvu' do
    it 'should export file' do
      file = Tempfile.new('')
      Djvu.file(fixture('Alice_in_Wonderland.djvu')).ddjvu(format: 'ppm', page: 1, output_file: file.path)
      expect(file.size).to be > 0
    end
  end

  context '#djvutxt' do
    it 'should export text layer' do
      file = Tempfile.new('')
      Djvu.file(fixture('Alice_in_Wonderland.djvu')).djvutxt(page: 8, output_file: file.path)
      expect(file.size).to be > 0
    end
  end

  context '#djvudump' do
    context 'should export dump' do
      it 'without output file' do
        dump = Djvu.file(fixture('Alice_in_Wonderland.djvu')).djvudump
        expect(dump.lines.first.strip!).to eql("FORM:DJVM [3548015]")
      end
      it 'with output file' do
        file = Tempfile.new('')
        Djvu.file(fixture('Alice_in_Wonderland.djvu')).djvudump(o: file.path)
        expect(file.size).to be > 0
      end
    end
  end

  context '#djvused' do
    it 'should return page count' do
      file = Tempfile.new('')
      num = Djvu.file(fixture('Alice_in_Wonderland.djvu')).djvused(e: 'n')
      expect(num.to_i).to eql(114)
    end
  end
end
