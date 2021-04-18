require_relative '../lib/parser'
require 'tempfile'

describe Parser do
  subject { described_class.new(log_file).parse }

  let(:log_file) do
    Tempfile.new(['webserver', '.log']).tap do |file|
      file.write(input)
      file.rewind
    end
  end

  context 'with blank file format' do
    let(:input) do
    end

    it 'should raise an invalid file error' do
      expect { subject }.to raise_error(InvalidFile)
    end
  end

  context 'with correct file format path and IP' do
    let(:input) do
      <<~IP
        /about 451.106.204.921
        /about 682.704.613.213
        /contact 802.683.925.780
        /contact 158.577.775.616
      IP
    end

    let(:expected_result) do
      {
        '/about' => ['451.106.204.921', '682.704.613.213'],
        '/contact' => ['802.683.925.780', '158.577.775.616']
      }
    end

    it 'should read the file and return expected format' do
      expect(subject).to eq(expected_result)
    end
  end
end
