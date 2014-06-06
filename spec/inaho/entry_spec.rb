require 'spec_helper'

describe Inaho::Entry do
  describe "#add_index" do
    it "should add string to index array" do
      entry = Inaho::Entry.new(id: 1, title: "稲穂", yomi: "いなほ")
      entry.add_index("稲穂")
      entry.add_index("いなほ")
      entry.add_index("inaho")
      entry.add_index("ear (head) of rice")

      entry.index.size.should == 4
    end
  end

  describe "#to_xml" do
    it "should return nil if body or title is nil" do
      entry = Inaho::Entry.new(id: 1, title: "稲穂", yomi: "いなほ")

      entry.to_xml.should be_nil
    end

    it "should transform to xml" do
      entry = Inaho::Entry.new(id: 1, title: "稲穂", yomi: "いなほ")
      entry.add_index("稲穂")
      entry.add_index("いなほ")
      entry.add_index("inaho")
      entry.add_index("ear (head) of rice")
      entry.body = "<h3>稲穂 (いなほ)</h3> <ul><li>ear (head) of rice</li></ul>"

      entry.to_xml.should_not be_nil
    end
  end
end
