require 'spec_helper'

describe Guard::Stendhal do
  subject { Guard::Stendhal.new }
  
  describe "run_all" do
    it "runs all specs" do
      Guard::Stendhal::Runner.should_receive(:run).with([""], :message => "Running all specs")
      subject.run_all
    end
    
    it "should pass options to runner" do
      subject = Guard::Stendhal.new([], { :bundler => false })
      Guard::Stendhal::Runner.should_receive(:run).with([""], :message => "Running all specs", :bundler => false)
      subject.run_all
    end
  end
  
  describe "run_on_change" do
    it "should run stendhal with paths" do
      Guard::Stendhal::Runner.should_receive(:run).with(["spec"], {})
      subject.run_on_change(["spec"])
    end
    
    it "should pass options to runner" do
      subject = Guard::Stendhal.new([], { :bundler => false })
      Guard::Stendhal::Runner.should_receive(:run).with(["spec"], :bundler => false)
      subject.run_on_change(["spec"])
    end
  end
  
end
