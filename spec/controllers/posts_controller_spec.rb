require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	describe "GET #index" do
			it "has a 200 status code" do
	      get :index
	      expect(response.status).to eq(200)
	    end

	    it "renders the index template"  do
	      get :index
	      expect(response).to render_template("index")
	      expect(response.body).to eq ""
	    end

	    it "renders the posts/index template"  do
	      get :index
	      expect(response).to  render_template("posts/index")
	      expect(response.body).to eq ""
	    end

	    it "not renders the 'new' template"  do
	      get :index
	      expect(response).not_to  render_template("new")
	    end
	end 


	describe "GET #new" do
			it "assigns a new Post to @post" do
	      get :new
	      expect(assigns(:post)).to  be_a_new(Post)
	   		 end

	    it "renders the :new template" do
	      get :new
	      expect(response).to render_template :new
	    end
	end 



	 describe "POST #create" do
    context "with invalid attributes" do
      # create动作, 在符合 REST 架构的程序中,这个动作可以响应 POST 请求。
      # create 动作和响应 GET 请求的动作最主要的不同点是,不能像 GET 请求那样只传入:id 参数,而
      # 要传入 params[:widget] 对应的值,这个值就是用户可能在表单中输入的内容。
      it "does not save the new widget in the database" do
        expect{
          post :create,
          post: attributes_for(:invalid_post)
        }.to change(Post, :count).by(0)
      end

 
  

      it "re-renders the :new template" do
        post :create,
          post: attributes_for(:invalid_post)
        expect(response).to render_template :new
      end
    end

    context  "with valid attributes" do
      it "does save the new widget in the database" do
        expect{
          post :create,
          post: attributes_for(:post)
        }.to change(Post, :count).by(1)
      end
      it "re-renders the assigns[:post] template" do
        post :create,
          post: attributes_for(:post)
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end
end


	describe "GET #destroy" do
		before :each do
        @post = create(:post)
      end

      it "delete the post" do
        expect{
          delete :destroy, id: @post
        }.to change(Post, :count).by(-1)
      end

      it "redirect to post#index" do
        delete :destroy, id: @post
        expect(response).to redirect_to posts_path
      end
	end 
end
