class Thing

end

class TestModel
  include CoreModel::Model
  attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => false
  has_many :things, :type => Thing, :inverse_relationship_name => "test_models", :delete_rule => NSCascadeDeleteRule
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

  describe "#has_many" do
    before do
      @test_relationship = TestModel.entity.relationshipsByName["things"]
    end

    it "should instantiate a new NSRelationshipDescription specified" do
      @test_relationship.class.should == NSRelationshipDescription
    end

    it "should set mincount to 0 when optional not specified" do
      @test_relationship.minCount.should == 0
    end

    it "should set maxcount to NSIntegerMax when optional not specified" do
      #TODO Check this
      #NSIntegerMax  gets converted to a signed integer ?
      @test_relationship.maxCount.should == -1
    end

    it "should set the destintation entity name to the type" do
      @test_relationship.destinationEntityName.should == "Thing"
    end

    it "should set the inverse relationship name " do
      @test_relationship.inverseRelationshipName.should == "test_models"
    end


  end

  describe "#attribute" do
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
