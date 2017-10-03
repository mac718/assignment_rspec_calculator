require 'calculator'

describe Calculator do
  let(:c) { Calculator.new}
  
  #initialize
  describe "#initialize" do 
    context "no arguments provided" do 
      it "returns Calculator object" do 
        expect(c).to be_an_instance_of(Calculator)
      end

      it "itnializes @memory to nil" do
        expect(c.memory).to eql(nil)
      end

      it "itnializes @stringify to false" do
        expect(c.instance_variable_get(:@stringify)).to be false
      end 
    end
  end

  #add
  describe "#add" do 
    context "two postive integers provided as arguments" do 
      context "2 and 3 are the arguments" do
        it "equals 5" do 
          expect(c.add(2, 3)).to eql(5)
        end
      end
    end

    context "two negative integers provided as arguments" do 
      context "-2 and -3 are the arguments" do
        it "equals -5" do 
          expect(c.add(-2, -3)).to eql(-5)
        end
      end
    end

    context "one negative integer and one postive integer provided as arguments" do 
      context "2 and -3 are the arguments" do
        it "equals -1" do 
          expect(c.add(2, -3)).to eql(-1)
        end
      end
    end

    context "two floats provided as arguments" do 
      context "-2.5 and 3.6 are the arguments" do
        it "equals 1.1" do 
          expect(c.add(-2.5, 3.6)).to eql(1.1)
        end
      end
    end
  end

  #subtract
  describe "#subtract" do 
    context "two postive integers provided as arguments" do 
      context "2 and 3 are the arguments" do
        it "equals -1" do 
          expect(c.subtract(2, 3)).to eql(-1)
        end
      end
    end

    context "two negative integers provided as arguments" do 
      context "-2 and -3 are the arguments" do
        it "equals 1" do 
          expect(c.subtract(-2, -3)).to eql(1)
        end
      end
    end

    context "one negative integer and one postive integer provided as arguments" do 
      context "2 and -3 are the arguments" do
        it "equals 5" do 
          expect(c.subtract(2, -3)).to eql(5)
        end
      end
    end

    context "two floats provided as arguments" do 
      context "-2.5 and 3.6 are the arguments" do
        it "equals -6.1" do 
          expect(c.subtract(-2.5, 3.6)).to eql(-6.1)
        end
      end
    end
  end

  #multiply
  describe "#multiply" do 
    context "two postive integers provided as arguments" do 
      context "2 and 3 are the arguments" do
        it "equals 6" do 
          expect(c.multiply(2, 3)).to eql(6)
        end
      end
    end

    context "two negative integers provided as arguments" do 
      context "-2 and -3 are the arguments" do
        it "equals 6" do 
          expect(c.multiply(-2, -3)).to eql(6)
        end
      end
    end

    context "one negative integer and one postive integer provided as arguments" do 
      context "2 and -3 are the arguments" do
        it "equals 6" do 
          expect(c.multiply(2, -3)).to eql(-6)
        end
      end
    end

    context "two floats provided as arguments" do 
      context "-2.5 and 3.6 are the arguments" do
        it "equals -9" do 
          expect(c.multiply(-2.5, 3.6)).to eql(-9.0)
        end
      end
    end
  end

  #divide
  describe "#divide" do 
    context "two postive integers provided as arguments that do not yield a remainder" do 
      context "6 and 2 are the arguments" do
        it "equals 3" do 
          expect(c.divide(6, 2)).to eql(3)
        end
      end
    end

    context "two postive integers provided as arguments that yield a remainder" do 
      context "6 and 4 are the arguments" do
        it "equals 1.5" do 
          expect(c.divide(6, 4)).to eql(1.5)
        end
      end
    end

    context "the second argument is 0" do 
      context "6 and 0 are the arguments" do
        it "raises an ArguemtError" do 
          expect{c.divide(6, 0)}.to raise_error(ArgumentError)
        end
      end
    end
  end

  #pow
  describe "#pow" do 
    context "positive. whole number as second argument" do 
      context "2 and 3 are the arguments" do
        it "equals 8" do 
          expect(c.pow(2, 3)).to eql(8.0)
        end
      end
    end

    context "negative, whole number as second argument" do 
      context "2 and 3 are the arguments" do
        it "equals 1/8" do 
          expect(c.pow(2, -3)).to eql(1/8.0)
        end
      end
    end

    context "the second argument is a decimal" do 
      context "27 and 1/3.0 are the arguments" do
        it "raises an ArguemtError" do 
          expect(c.pow(27, 1/3.0)).to eql(3.0)
        end
      end
    end
  end

  #sqrt
  describe "#sqrt" do 
    context "positive. whole number with round root as argument" do 
      context "9 is the argument" do
        it "equals 3" do 
          expect(c.sqrt(9)).to eql(3)
        end
      end
    end

    context "positive. whole number with npn-round root as argument" do 
      context "8 is the argument" do
        it "equals 2.83" do 
          expect(c.sqrt(8)).to eql(2.83)
        end
      end
    end

    context "negative number as argument" do 
      context "-9 is the argument" do
        it "raise error" do 
          expect{c.sqrt(-9)}.to raise_error
        end
      end
    end
  end

  #memory=
  describe "#memory=" do 
    context "sets the value of @memory instance variable" do 
      context "9 is the argument" do
        it "sets the value of @memory to 9" do
          test_value = 9
          c.memory = test_value  
          expect(c.memory).to eql(9)
        end
      end
    end
  end

  describe "#memory" do 
    context "no argument given" do       it "equals nil" do 
        expect(c.memory).to eql(nil)
      end
    end

    context "argument given" do
      context "9 is the argument" do
        it "equals 9" do
          test_value = 9
          c.memory = test_value 
          expect(c.memory).to eql(9)
        end
      end
    end

    context "argument given and value has been returned and cleared" do
      context "9 is the argument" do
      before do 
        test_value = 9
        c.memory = test_value 
        c.memory
      end
        it "equals nil" do
          expect(c.memory).to eql(nil)
        end
      end
    end
  end

  describe "stringify" do 
    context "stringify is initialized to true" do
      let(:c) { Calculator.new(true) }
      it "turns the output of computational funtions into a string" do 
        expect(c.add(1,3)).to eql('4')
      end
    end
  end
end