require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BriefVendorsController do

  # This should return the minimal set of attributes required to create a valid
  # BriefVendor. As you add validations to BriefVendor, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all brief_vendors as @brief_vendors" do
      brief_vendor = BriefVendor.create! valid_attributes
      get :index
      assigns(:brief_vendors).should eq([brief_vendor])
    end
  end

  describe "GET show" do
    it "assigns the requested brief_vendor as @brief_vendor" do
      brief_vendor = BriefVendor.create! valid_attributes
      get :show, :id => brief_vendor.id
      assigns(:brief_vendor).should eq(brief_vendor)
    end
  end

  describe "GET new" do
    it "assigns a new brief_vendor as @brief_vendor" do
      get :new
      assigns(:brief_vendor).should be_a_new(BriefVendor)
    end
  end

  describe "GET edit" do
    it "assigns the requested brief_vendor as @brief_vendor" do
      brief_vendor = BriefVendor.create! valid_attributes
      get :edit, :id => brief_vendor.id
      assigns(:brief_vendor).should eq(brief_vendor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BriefVendor" do
        expect {
          post :create, :brief_vendor => valid_attributes
        }.to change(BriefVendor, :count).by(1)
      end

      it "assigns a newly created brief_vendor as @brief_vendor" do
        post :create, :brief_vendor => valid_attributes
        assigns(:brief_vendor).should be_a(BriefVendor)
        assigns(:brief_vendor).should be_persisted
      end

      it "redirects to the created brief_vendor" do
        post :create, :brief_vendor => valid_attributes
        response.should redirect_to(BriefVendor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved brief_vendor as @brief_vendor" do
        # Trigger the behavior that occurs when invalid params are submitted
        BriefVendor.any_instance.stub(:save).and_return(false)
        post :create, :brief_vendor => {}
        assigns(:brief_vendor).should be_a_new(BriefVendor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BriefVendor.any_instance.stub(:save).and_return(false)
        post :create, :brief_vendor => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested brief_vendor" do
        brief_vendor = BriefVendor.create! valid_attributes
        # Assuming there are no other brief_vendors in the database, this
        # specifies that the BriefVendor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BriefVendor.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => brief_vendor.id, :brief_vendor => {'these' => 'params'}
      end

      it "assigns the requested brief_vendor as @brief_vendor" do
        brief_vendor = BriefVendor.create! valid_attributes
        put :update, :id => brief_vendor.id, :brief_vendor => valid_attributes
        assigns(:brief_vendor).should eq(brief_vendor)
      end

      it "redirects to the brief_vendor" do
        brief_vendor = BriefVendor.create! valid_attributes
        put :update, :id => brief_vendor.id, :brief_vendor => valid_attributes
        response.should redirect_to(brief_vendor)
      end
    end

    describe "with invalid params" do
      it "assigns the brief_vendor as @brief_vendor" do
        brief_vendor = BriefVendor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BriefVendor.any_instance.stub(:save).and_return(false)
        put :update, :id => brief_vendor.id, :brief_vendor => {}
        assigns(:brief_vendor).should eq(brief_vendor)
      end

      it "re-renders the 'edit' template" do
        brief_vendor = BriefVendor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BriefVendor.any_instance.stub(:save).and_return(false)
        put :update, :id => brief_vendor.id, :brief_vendor => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested brief_vendor" do
      brief_vendor = BriefVendor.create! valid_attributes
      expect {
        delete :destroy, :id => brief_vendor.id
      }.to change(BriefVendor, :count).by(-1)
    end

    it "redirects to the brief_vendors list" do
      brief_vendor = BriefVendor.create! valid_attributes
      delete :destroy, :id => brief_vendor.id
      response.should redirect_to(brief_vendors_url)
    end
  end

end
