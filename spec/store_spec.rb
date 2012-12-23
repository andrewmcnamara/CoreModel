describe "Store" do
  describe "shared" do
    it "should only return an CoreModel::Store" do
      CoreModel::Store.shared.class.should == CoreModel::Store
    end
    it "should only create one instance of Store" do
     CoreModel::Store.shared.should.be.same_as CoreModel::Store.shared
    end
  end
end