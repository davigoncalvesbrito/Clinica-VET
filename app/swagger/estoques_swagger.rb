module EstoquesSwagger
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/estoques' do
      operation :get do
        key :summary, 'Lista todos os estoques'
        key :operationId, 'getEstoques'
        key :produces, ['application/json']
        key :tags, ['Estoques']
        response 200 do
          key :description, 'Lista de estoques'
          schema type: :array do
            items do
              key :'$ref', :Estoque
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :post do
        key :summary, 'Cria um novo estoque'
        key :operationId, 'createEstoque'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Estoques']
        parameter name: :estoque, in: :body, required: true, description: 'Dados do estoque', schema: { '$ref' => '#/definitions/EstoqueInput' }
        response 201 do
          key :description, 'Estoque criado'
          schema do
            key :'$ref', :Estoque
          end
        end
        response 422 do
          key :description, 'Erro de validação'
          schema do
            key :type, :object
            property :errors do
              key :type, :array
              items do
                key :type, :string
              end
            end
          end
        end
        security do
          key :Bearer, []
        end
      end
    end

    swagger_path '/estoques/{id}' do
      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID do estoque'
      
      operation :get do
        key :summary, 'Busca um estoque pelo ID'
        key :operationId, 'getEstoqueById'
        key :produces, ['application/json']
        key :tags, ['Estoques']
        response 200 do
          key :description, 'Detalhes do estoque'
          schema do
            key :'$ref', :Estoque
          end
        end
        response 404 do
          key :description, 'Estoque não encontrado'
        end
        security do
          key :Bearer, []
        end
      end

      operation :put do
        key :summary, 'Atualiza um estoque existente'
        key :operationId, 'updateEstoque'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Estoques']
        parameter name: :estoque, in: :body, required: true, description: 'Dados atualizados do estoque', schema: { '$ref' => '#/definitions/EstoqueInput' }
        response 200 do
          key :description, 'Estoque atualizado'
          schema do
            key :'$ref', :Estoque
          end
        end
        response 422 do
          key :description, 'Erro de validação'
          schema do
            key :type, :object
            property :errors do
              key :type, :array
              items do
                key :type, :string
              end
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :delete do
        key :summary, 'Deleta um estoque'
        key :operationId, 'deleteEstoque'
        key :produces, ['application/json']
        key :tags, ['Estoques']
        response 204 do
          key :description, 'Estoque deletado com sucesso'
        end
        response 404 do
          key :description, 'Estoque não encontrado'
        end
        security do
          key :Bearer, []
        end
      end
    end

    # Definição do modelo Estoque
    swagger_schema :Estoque do
      key :required, [:id, :nome, :descricao, :quantidade, :unidade_de_medida, :data_de_validade, :fornecedor, :preco_de_compra, :localizacao, :codigo_do_produto, :categoria, :data_de_entrada]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :nome do
        key :type, :string
      end
      property :descricao do
        key :type, :string
      end
      property :quantidade do
        key :type, :integer
        key :format, :int64
      end
      property :unidade_de_medida do
        key :type, :string
      end
      property :data_de_validade do
        key :type, :string
        key :format, :date
      end
      property :fornecedor do
        key :type, :string
      end
      property :preco_de_compra do
        key :type, :number
        key :format, :float
      end
      property :localizacao do
        key :type, :string
      end
      property :codigo_do_produto do
        key :type, :string
      end
      property :categoria do
        key :type, :string
      end
      property :data_de_entrada do
        key :type, :string
        key :format, :date
      end
    end

    # Definição do input para criar ou atualizar estoques
    swagger_schema :EstoqueInput do
      key :required, [:nome, :descricao, :quantidade, :unidade_de_medida, :data_de_validade, :fornecedor, :preco_de_compra, :localizacao, :codigo_do_produto, :categoria, :data_de_entrada]
      property :nome do
        key :type, :string
      end
      property :descricao do
        key :type, :string
      end
      property :quantidade do
        key :type, :integer
        key :format, :int64
      end
      property :unidade_de_medida do
        key :type, :string
      end
      property :data_de_validade do
        key :type, :string
        key :format, :date
      end
      property :fornecedor do
        key :type, :string
      end
      property :preco_de_compra do
        key :type, :number
        key :format, :float
      end
      property :localizacao do
        key :type, :string
      end
      property :codigo_do_produto do
        key :type, :string
      end
      property :categoria do
        key :type, :string
      end
      property :data_de_entrada do
        key :type, :string
        key :format, :date
      end
    end
  end
end
