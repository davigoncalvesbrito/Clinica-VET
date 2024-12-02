# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_26_172127) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "nome"
    t.string "sexo"
    t.string "raca"
    t.string "especie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tutor_id", null: false
    t.index ["tutor_id"], name: "index_animals_on_tutor_id"
  end

  create_table "consulta", force: :cascade do |t|
    t.datetime "data_hora"
    t.string "sintomas"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "veterinario_id"
    t.bigint "animal_id", null: false
    t.index ["animal_id"], name: "index_consulta_on_animal_id"
    t.index ["veterinario_id"], name: "index_consulta_on_veterinario_id"
  end

  create_table "estoques", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "quantidade"
    t.string "unidade_de_medida"
    t.date "data_de_validade"
    t.string "fornecedor"
    t.decimal "preco_de_compra"
    t.string "localizacao"
    t.string "codigo_do_produto"
    t.string "categoria"
    t.date "data_de_entrada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internamentos", force: :cascade do |t|
    t.date "data_inicio"
    t.date "data_fim"
    t.text "observacoes"
    t.bigint "animal_id", null: false
    t.bigint "veterinario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_internamentos_on_animal_id"
    t.index ["veterinario_id"], name: "index_internamentos_on_veterinario_id"
  end

  create_table "prescricao_medicas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "consulta_id", null: false
    t.index ["consulta_id"], name: "index_prescricao_medicas_on_consulta_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_tutors_on_cpf", unique: true
  end

  create_table "veterinarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "crmv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crmv"], name: "index_veterinarios_on_crmv", unique: true
    t.index ["email"], name: "index_veterinarios_on_email", unique: true
  end

  add_foreign_key "animals", "tutors"
  add_foreign_key "consulta", "animals"
  add_foreign_key "consulta", "veterinarios"
  add_foreign_key "internamentos", "animals"
  add_foreign_key "internamentos", "veterinarios"
  add_foreign_key "prescricao_medicas", "consulta", column: "consulta_id"
end
