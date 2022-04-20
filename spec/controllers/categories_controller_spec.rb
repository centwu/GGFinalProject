require 'rails_helper'

RSpec.describe CategoriesController do
	subject(:admin) do
    return FactoryBot.create(:user)
  end
	
	describe 'GET #index' do
		it "populates an array of all categories" do
			japanese = create(:category, name: "Japanese")
      korean = create(:category, name: "Korean")
      get :index
      expect(assigns(:categories)).to match_array([japanese, korean])
		end
		
    it "renders the :index template" do
			get :index
      expect(response).to render_template :index
    end
		
  end

	describe 'GET #show' do
    it "assigns the requested category to @category" do
			category = create(:category)
			get :show, params: { id: category }
      expect(assigns(:category)).to eq category
		end
    
		it "renders the :show template" do
			category = create(:category)
      get :show, params: { id: category }
      expect(response).to render_template :show
		end
  end

	describe 'GET #new' do
		context "with non-admin" do
	    it "assigns a new Category to @category" do
	      get :new
	      expect(assigns(:category)).to eq(nil)
	    end
	
	    it "renders the :new template" do
	      get :new
	      expect(:response).to redirect_to root_path
	    end
		end

		context "with admin" do
			it "assigns a new Category to @category" do
				sign_in admin
				get :new
      	expect(assigns(:category)).to be_a_new(Category)
    	end

    	it "renders the :new template" do
				sign_in admin
				get :new
      	expect(:response).to render_template :new
    	end
		end
	end
	
	describe 'GET #edit' do
		context "with non-admin" do
	    it "assigns the requested category to @category" do
				category = create(:category)
	      get :edit, params: { id: category }
	      expect(assigns(:category)).to eq(nil)
			end
			
  	  it "renders the :edit template" do
				category = create(:category)
	 	    get :edit, params: { id: category }
	      expect(:response).to redirect_to root_path
			end
		end

		context "with admin" do
	    it "assigns the requested category to @category" do
				sign_in admin
				category = create(:category)
	      get :edit, params: { id: category }
	      expect(assigns(:category)).to eq category
			end
			
  	  it "renders the :edit template" do
				sign_in admin
				category = create(:category)
	      get :edit, params: { id: category }
	      expect(response).to render_template :edit
			end
		end
	end

	describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new category in the database" do
				sign_in admin
				expect{
          post :create, params: { category: attributes_for(:category) }
        }.to change(Category, :count).by(1)
			end
			
      it "redirects to categories#show" do
				sign_in admin
				post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(category_path(assigns[:category]))
			end
    end

    context "with invalid attributes" do
      it "does not save the new category in the database" do
				sign_in admin
				expect{
          post :create, params: { category: attributes_for(:invalid_category) }
        }.not_to change(Category, :count)
			end
			
      it "re-renders the :new template" do
				sign_in admin
				post :create, params: { category: attributes_for(:invalid_category) }
        expect(response).to render_template :new
			end
    end
  end

	describe 'PATCH #update' do
		before :each do
      @category = create(:category)
    end
		
    context "with valid attributes" do
      it "locates the requested @category" do
				sign_in admin
				patch :update, params: { id: @category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq @category
			end
			
      it "changes @category's attributes" do
				sign_in admin
				patch :update, params: { id: @category, category: attributes_for(:category, name: 'Kategori lain') }
        @category.reload
        expect(@category.name).to eq('Kategori lain')
			end
			
      it "redirects to the category" do
				sign_in admin
				patch :update, params: { id: @category, category: attributes_for(:category) }
        expect(response).to redirect_to @category
			end
    end

    context "with invalid attributes" do
      it "does not update the category in the database" do
				sign_in admin
				patch :update, params: { id: @category, category: attributes_for(:invalid_category) }
        expect(@category.name).not_to eq('Kategori lain')
			end
			
      it "re-renders the :edit template" do
				sign_in admin
				patch :update, params: { id: @category, category: attributes_for(:invalid_category) }
        expect(assigns(:category)).to eq @category
        expect(response).to have_http_status(:unprocessable_entity)
			end
    end
  end

	describe 'DELETE #destroy' do
		before :each do
      @category = create(:category)
    end
    it "deletes the category from the database" do
			sign_in admin
			expect{
        delete :destroy, params: { id: @category }
      }.to change(Category, :count).by(-1)
		end
		
    it "redirects to categories#index" do
			sign_in admin
			delete :destroy, params: { id: @category }
      expect(response).to redirect_to categories_url
		end
  end
end