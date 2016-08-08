

class Image

  attr_accessor :multiarray
  def initialize (multiarray)
    self.multiarray = multiarray
  end 

  def output_image
    multiarray.each do |row| # need to clarify with Sean what each do task is doing
      row.each do |cell|
        print cell
      end
      puts ""
    end
  end

  def transform
    blurarray = Marshal.load( Marshal.dump(multiarray) )
    
    multiarray.each_index do |row| # need to clarify with Sean what each do task is doing
      subarray = multiarray[row]
      subarray.each_index do |cell|
        if multiarray[row][cell] == 1
            if  row-1 >= 0 
            blurarray[row-1][cell] = 1
            end
            if row+1 < multiarray.count
            blurarray[row+1][cell] = 1     
            end

            if  cell-1 >= 0
            blurarray[row][cell-1] = 1
            end
            if cell+1 < multiarray.count
            blurarray[row][cell+1] = 1
            end
          end
      end
    end

    blurarray.each do |row| # need to clarify with Sean what each do task is doing
      row.each do |cell|
        print cell
      end
      puts ""
    end

  end
      
end


#takes a multi-array input Image.new and returns it on the terminal

#Check output_image
RSpec.describe Image do
    it "returns multi-array output from multi-array input" do
      image = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
      ])
# is it possible to check against stdout?? tried .to output().to_stdout
      expect(image.output_image).to eq ([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
      ])
    end
  end
#check transform
RSpec.describe Image do
    it "returns transformed array1" do
      image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
      ])
      expect(image.transform).to eq ([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
      ])
    end
    it "returns transformed array2" do
      image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
      ])
      expect(image.transform).to eq ([
      [0, 0, 1, 0],
      [0, 1, 1, 1],
      [0, 1, 1, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
      ])
    end
    it "returns transformed array3" do
      image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [0, 0, 0, 0]
      ])
      expect(image.transform).to eq ([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0]
      ])
    end
  end