require 'spec_helper'

describe "Form Params" do

  before :all do
    class FormParamApi < Grape::API
      format :json

      params do
        requires :name, type: String, desc: "name of item"
      end
      post '/items' do
        {}
      end

      params do
        requires :id, type: Integer, desc: "id of item"
        requires :name, type: String, desc: "name of item"
      end
      put '/items/:id' do
        {}
      end

      params do
        requires :id, type: Integer, desc: "id of item"
        requires :name, type: String, desc: "name of item"
      end
      patch '/items/:id' do
        {}
      end

      add_swagger_documentation
    end
  end

  def app; FormParamApi; end

  it "retrieves the documentation form params" do
    get '/swagger_doc/items.json'

    JSON.parse(last_response.body).should == {
      "apiVersion" => "0.1",
      "swaggerVersion" => "1.2",
      "resourcePath" => "",
      "basePath"=>"http://example.org",
      "apis" => [
        {
          "path" => "/items.{format}",
          "operations" => [
            {
              "consumes" => ["application/json"],
              "produces" => ["application/json"],
              "notes" => "",
              "summary" => "",
              "nickname" => "POST-items---format-",
              "method" => "POST",
              "httpMethod" => "POST",
              "parameters" => [ { "paramType" => "form", "name" => "name", "description" => "name of item", "type" => "String", "dataType" => "String", "required" => true, "allowMultiple" => false } ],
              "type" => "void"
            }
          ]
        }, {
          "path" => "/items/{id}.{format}",
          "operations" => [
            {
              "consumes" => ["application/json"],
              "produces" => ["application/json"],
              "notes" => "",
              "summary" => "",
              "nickname" => "PUT-items--id---format-",
              "method" => "PUT",
              "httpMethod" => "PUT",
              "parameters" => [ { "paramType" => "path", "name" => "id", "description" => "id of item", "type" => "Integer", "dataType" => "Integer", "required" => true, "allowMultiple" => false }, { "paramType" => "form", "name" => "name", "description" => "name of item", "type" => "String", "dataType" => "String", "required" => true, "allowMultiple" => false } ],
              "type" => "void"
            },
            {
              "consumes" => ["application/json"],
              "produces" => ["application/json"],
              "notes" => "",
              "summary" => "",
              "nickname" => "PATCH-items--id---format-",
              "method" => "PATCH",
              "httpMethod" => "PATCH",
              "parameters" => [ { "paramType" => "path", "name" => "id", "description" => "id of item", "type" => "Integer", "dataType" => "Integer", "required" => true, "allowMultiple" => false }, { "paramType" => "form", "name" => "name", "description" => "name of item", "type" => "String", "dataType" => "String", "required" => true, "allowMultiple" => false } ],
              "type" => "void"
            }
          ]
        }
      ]
    }
  end
end
