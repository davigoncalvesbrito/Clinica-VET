class EstoquesController < ApplicationController
    # Pular autenticação para facilitar os testes
    include EstoquesSwagger
    # skip_before_action :authorize_request
  
    before_action :set_estoque, only: [:show, :update, :destroy]
  
    # GET /estoques
    def index
      @estoques = Estoque.all
      render json: @estoques, status: :ok
    end
  
    # GET /estoques/:id
    def show
      render json: @estoque, status: :ok
    end
  
    # POST /estoques
    def create
      @estoque = Estoque.new(estoque_params)
      if @estoque.save
        render json: @estoque, status: :created
      else
        render json: @estoque.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /estoques/:id
    def update
      if @estoque.update(estoque_params)
        render json: @estoque, status: :ok
      else
        render json: @estoque.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /estoques/:id
    def destroy
      @estoque.destroy
      head :no_content
    end
  
    private
  
    def set_estoque
      @estoque = Estoque.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Estoque não encontrado' }, status: :not_found
    end
  
    def estoque_params
      params.require(:estoque).permit(:nome, :descricao, :quantidade, :unidade_de_medida, :data_de_validade, :fornecedor, :preco_de_compra, :localizacao, :codigo_do_produto, :categoria, :data_de_entrada)
    end
  end
  