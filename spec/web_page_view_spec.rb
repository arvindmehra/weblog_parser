require_relative '../lib/web_page_view'

describe WebPageView do
  subject { described_class.new(log_file).views }

  context 'with file not provided' do
    let(:log_file) { "" }

    it 'should raise a file not found exception' do
      expect { subject }.to raise_error(FileNotFound)
    end
  end

  context 'with correct log file present' do
    let(:log_file) { 'webserver.log' }
    let(:expected_output) do
      <<~Result
        Total Visit

        /about/2             90 visits
        /contact             89 visits
        /index               82 visits
        /about               81 visits
        /help_page/1         80 visits
        /home                78 visits

        Unique Visit

        /index               23 unique views
        /home                23 unique views
        /contact             23 unique views
        /help_page/1         23 unique views
        /about/2             22 unique views
        /about               21 unique views

      Result
    end

    it 'should return page visits' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end
end
