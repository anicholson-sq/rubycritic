require "test_helper"
require "rubycritic/adapters/smell/flay"
require "rubycritic/core/analysed_file"
require "pathname"

describe Rubycritic::SmellAdapter::Flay do
  before do
    @analysed_file = Rubycritic::AnalysedFile.new(
      :pathname => Pathname.new("test/samples/flay/smelly.rb"),
      :smells => []
    )
    analysed_files = [@analysed_file]
    Rubycritic::SmellAdapter::Flay.new(analysed_files).smells
  end

  it "detects smells and adds them to analysed_files" do
    @analysed_file.smells.wont_be_empty
  end

  it "creates smells with messages" do
    smell = @analysed_file.smells.first
    smell.message.must_be_instance_of String
  end

  it "creates smells with scores" do
    smell = @analysed_file.smells.first
    smell.score.must_be_kind_of Numeric
  end
end