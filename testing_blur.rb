class Image

  attr_accessor :multiarray
  def initialize (multiarray)
    self.multiarray = multiarray
  end 

  def output_image(ary = @multiarray)
    ary.each do |row| # lines 9-14 is a block being passed through .each function need to clarify with Sean what each do task is doing
      row.each do |cell|
        print cell
      end
      puts ""
    end
  end
  
  def blur(n) # transform is always within manhattan distance, can be used iteratively
    n.times do #once (1) transform is done, newly replaced 1s can be transformed
      @multiarray = transformed_image #make sure @ instant variable is 
    end
    
    self.output_image(multiarray)
    
  end
  
  def transformed_image
    blurarray = Marshal.load( Marshal.dump(multiarray) )
    
    multiarray.each_index do |row| # need to clarify with Sean what each do task is doing
      subarray = multiarray[row]
      subarray.each_index do |cell|
        if multiarray[row][cell] == 1
            if  row-1 >= 0 #top barrier
            blurarray[row-1][cell] = 1
            end
            if row+1 < multiarray.count
            blurarray[row+1][cell] = 1     
            end
            if  cell-1 >= 0
            blurarray[row][cell-1] = 1
            end
            if cell+1 < multiarray[row].count
            blurarray[row][cell+1] = 1
            end
        end
      end
    end
    
    blurarray
  end

  def transform
    self.output_image(transformed_image) # self left here to show that it's calling method upon itself with another transformed_image in parameter
  end
      
end

RSpec.describe Image do
  it "Returns transformed Manhattan(1)" do
    image = Image.new([
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
  ])
    expect(image.blur(1)).to eq([
  [0, 0, 0, 1, 1],
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 0],
  [1, 1, 1, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0]
  ])
  end
end

RSpec.describe Image do
  it "Returns transformed Manhattan(2)" do
    image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
  ])
    expect(image.blur(2)).to eq([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [1, 1, 1, 0],
  [1, 1, 1, 1],
  [1, 1, 1, 0],
  [0, 1, 0, 0]
  ])
  end
end

RSpec.describe Image do
  it "Returns transformed Manhattan(3)" do
    image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
  ])
    expect(image.blur(3)).to eq([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 0, 0, 0, 0],
  [0, 1, 1, 1, 1, 1, 0, 0, 0],
  [1, 1, 1, 1, 1, 1, 1, 0, 0],
  [0, 1, 1, 1, 1, 1, 0, 0, 0],
  [0, 0, 1, 1, 1, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 1, 1],
  [0, 0, 0, 0, 0, 0, 1, 1, 1],
  [0, 0, 0, 0, 0, 1, 1, 1, 1]
  ])
  end
end