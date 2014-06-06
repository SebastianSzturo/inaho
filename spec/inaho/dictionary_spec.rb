require 'spec_helper'

describe Inaho::Dictionary do
  describe "#validate" do
    it "should validate xml" do
      dictionary = Inaho::Dictionary.new
      entry = Inaho::Entry.new(id: "inaho", title: "稲穂", yomi: "いなほ")
      entry.add_index("いなほ")
      entry.add_index("inaho")
      entry.body = "<h3>稲穂 (いなほ)</h3> <ul><li>ear (head) of rice</li></ul>"
      dictionary << @entry

      dictionary.validate.should == true
    end

    it "should not be valid without index" do
      dictionary = Inaho::Dictionary.new
      entry = Inaho::Entry.new(id: "inaho", title: "稲穂", yomi: "いなほ")
      entry.body = "<h3>稲穂 (いなほ)</h3> <ul><li>ear (head) of rice</li></ul>"
      dictionary << @entry

      dictionary.validate.should be_kind_of(Array)
    end

    it "should be valid without a yomi" do
      dictionary = Inaho::Dictionary.new
      entry = Inaho::Entry.new(id: "inaho", title: "稲穂")
      entry.id = "inaho_1"
      entry.add_index("いなほ")
      entry.add_index("inaho")
      entry.body = "<h3>稲穂 (いなほ)</h3> <ul><li>ear (head) of rice</li></ul>"

      dictionary.validate.should == true
    end
  end

end
