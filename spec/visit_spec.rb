require_relative '../lib/visit'

describe Visit do
  context 'with parsed result and total visit' do
  subject { described_class.new(parsed_result).total_visit }
  let(:parsed_result) do
    {
      "/index"=> ["444.701.448.104", "444.701.448.104", "802.683.925.780"],
      "/home"=>  ["235.313.352.950", "235.313.352.950"],
      "/about"=> ["061.945.150.735", "061.945.150.735", "235.313.352.950", "836.973.694.403"]
    }
  end

    let(:expected_result) do
      {"/about"=>4, "/index"=>3, "/home"=>2}
    end

    it 'should output the hash of total visit in desc order ' do
      expect(subject).to eq(expected_result)
    end
  end


  context 'with parsed result and unique visit' do
    subject { described_class.new(parsed_result).unique_visit }
    let(:parsed_result) do
      {
        "/index"=> ["444.701.448.104", "444.701.448.104", "802.683.925.780"],
        "/home"=>  ["235.313.352.950", "235.313.352.950"],
        "/about"=> ["061.945.150.735", "061.945.150.735", "235.313.352.950", "836.973.694.403"]
      }
    end

    let(:expected_result) do
      {"/about"=>3, "/index"=>2, "/home"=>1}
    end

     it 'should output the hash of unique visit in desc order' do
      expect(subject).to eq(expected_result)
    end
  end


end
