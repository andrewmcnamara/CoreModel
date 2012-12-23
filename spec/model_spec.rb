class TestModel
  include CoreModel::Model
  attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => false
end
describe "Model" do
  describe "#entity" do
    it "should return an NSEntityDescription " do
      TestModel.entity.class.should == NSEntityDescription
    end

    it "should include the specified attribute in the NSEntityDescription attributes" do
      TestModel.entity.attributesByName.should.include "name"
    end

    it "should memoize the NSEntityDescription returned" do
      TestModel.entity.should.be.same_as TestModel.entity
    end

  end
  describe "attribute" do
    before do
      @test_attribute = TestModel.entity.propertiesByName["name"]
    end

    it "should instantiate a new NSAttributeDescription specified" do
      @test_attribute.class.should == NSAttributeDescription
    end

    it "should set optional from 'optional' parameter specified for attribute" do
      @test_attribute.isOptional.should == false
    end

    it "should set indexed from 'indexed' parameter specified for attribute" do
      @test_attribute.isIndexed.should == false
    end

    it "should set transient from 'transient' parameter specified for attribute" do
      @test_attribute.isTransient.should == false
    end

    it "should set attribute_type from 'type' parameter specified for attribute" do
      @test_attribute.attributeType.should == NSStringAttributeType
    end
  end
#it "should create an NSManagedObject model" do
#
#end


end
