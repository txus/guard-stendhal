require 'spec_helper'

describe Guard::Stendhal::Runner do
  subject { Guard::Stendhal::Runner }

  describe "#run" do
    
    context "in empty folder" do
      before(:each) do
        Dir.stub(:pwd).and_return(@fixture_path.join("empty"))
      end
      
      it "should run with Stendhal" do
        subject.should_receive(:system).with(
          "stendhal"
        )
        subject.run([""])
      end
      
      it "should run without bundler in spite of the option" do
        subject.should_receive(:system).with(
          "stendhal"
        )
        subject.run([""], :bundler => true)
      end

      it "should run without bundler" do
        subject.should_receive(:system).with(
          "stendhal"
        )
        subject.run([""], :bundler => false)
      end
    end

    context "in a folder with a Gemfile" do
      before(:each) do
        Dir.stub(:pwd).and_return(@fixture_path.join("bundler"))
      end
      
      it "should run with Stendhal" do
        subject.should_receive(:system).with(
          "bundle exec stendhal"
        )
        subject.run([""])
      end
      
      it "should run with bundler argument" do
        subject.should_receive(:system).with(
          "bundle exec stendhal"
        )
        subject.run([""], :bundler => true)
      end

      it "should run without bundler" do
        subject.should_receive(:system).with(
          "stendhal"
        )
        subject.run([""], :bundler => false)
      end
    end
  end
      
  
end
