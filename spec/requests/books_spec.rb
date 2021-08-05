# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Books", type: :request do
  let(:book) { create(:book) }
  let(:no_policy) { allow(BookPolicy).to receive(:new).and_return(NoPolicy.new) }
  let(:yes_policy) { allow(BookPolicy).to receive(:new).and_return(YesPolicy.new) }

  describe "GET /books" do
    let(:get_books) { get "/books" }

    context "when no user" do
      before(:each) { get_books }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        no_policy
        get_books
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        yes_policy
        get_books
      end

      include_examples "successful examples", :index
    end
  end

  describe "GET /books/:id" do
    let(:get_book) { get "/books/#{book.id}" }

    context "when no user" do
      before(:each) { get_book }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        no_policy
        get_book
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        yes_policy
        get_book
      end

      include_examples "successful examples", :show
    end
  end

  describe "GET /books/new" do
    let(:get_new_book) { get "/books/new" }

    context "when no user" do
      before(:each) { get_new_book }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        no_policy
        get_new_book
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        yes_policy
        get_new_book
      end

      include_examples "successful examples", :new
    end
  end

  describe "GET /books/:id/edit" do
    let(:get_edit_book) { get "/books/#{book.id}/edit" }

    context "when no user" do
      before(:each) { get_edit_book }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        no_policy
        get_edit_book
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        yes_policy
        get_edit_book
      end

      include_examples "successful examples", :edit
    end
  end

  describe "POST /books" do
    let(:post_book) { post "/books", params: { book: params } }
    let(:valid_params) { attributes_for(:book, price: 1.1) }

    context "when no user" do
      let(:params) { valid_params }

      before(:each) { post_book }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user
      let(:params) { valid_params }

      before(:each) do
        no_policy
        post_book
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      context "with invalid params" do
        let(:params) { { icon: "" } }

        before(:each) do
          yes_policy
          post_book
        end

        include_examples "unsuccessful examples", :new
      end

      context "with valid params" do
        let(:params) { valid_params }

        before(:each) do
          yes_policy
          post_book
        end

        include_examples "update examples",
                         :show,
                         { type: :notice, message: "Book was successfully created." },
                         { model: :book, field: :price, eq: 1.1 }
      end
    end
  end
end
