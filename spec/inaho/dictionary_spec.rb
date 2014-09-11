require 'spec_helper'

describe Inaho::Dictionary do
  describe "entries" do
    it "should add entries and return array of entries" do
      dictionary = Inaho::Dictionary.new

      entry1 = Inaho::Entry.new(id: 1, title: "稲穂", yomi: "いなほ")
      entry2 = Inaho::Entry.new(id: 2, title: "卵", yomi: "たまご")

      dictionary << entry1
      dictionary << entry2

      dictionary.entries.should be_kind_of(Array)
    end
  end

  describe "#to_xml" do
    it "should transform to xml" do
      dictionary = Inaho::Dictionary.new

      entry = Inaho::Entry.new(id: 1, title: "稲穂", yomi: "いなほ")
      entry.add_index("稲穂")
      entry.add_index("いなほ")
      entry.add_index("inaho")
      entry.add_index("ear (head) of rice")
      entry.body = "<h3>稲穂 (いなほ)</h3> <ul><li>ear (head) of rice</li></ul>"

      dictionary << entry

      dictionary.to_xml.should_not be_nil
    end
  end
end
