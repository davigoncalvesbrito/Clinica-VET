# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Tutor.create([
  { nome: 'João Silva', email: 'joao@gmail.com', cpf: '05030910823' },
  { nome: 'Maria Oliveira', email: 'maria@gmail.com', cpf: '12930910243' },
  { nome: 'Pedro Santos', email: 'pedro@gmail.com', cpf: '22930910244'},
  { nome: 'Silvana Lins', email: 'silvana@gmail.com', cpf: '98939710244' },
  { nome: 'Dilson Paulo', email: 'dilson@gmail.com', cpf: '07050710326'}
])

Animal.create([
  { nome: 'Rex', sexo: 'Masculino', especie: "Cachorro" , raca:"SRD", tutor_id: 1},
  { nome: 'Miau', sexo: 'Feminino', especie: "Gato", raca: "Sphinx", tutor_id: 2 },
  { nome: 'Cristiano', sexo: 'Masculino', especie: "Gato", raca: "SRD", tutor_id: 2},
  { nome: 'Vassoura', sexo: 'Feminino', especie: "Cachorro", raca: "Pug", tutor_id: 3 },
  { nome: 'Louro José', sexo: 'Masculino', especie: "Papagaio", raca: "SRD", tutor_id: 4},
  { nome: 'Romeu', sexo: 'Masculino', especie: "Rato", raca: "SRD", tutor_id: 5}
])





Veterinario.create([
  {nome: "Davi Godoy", email: "davi@gmail.com" , crmv: "12456789"},
  {nome: "Anderson Santos", email: "anderson@gmail.com" , crmv: "34591958"},
  {nome: "Leonardo Branch", email: "leonardo@gmail.com" , crmv: "78614817"}
]
)

Consulta.create(
  [
    {data_hora: "2024-06-30 22:06:30", sintomas: "Machucado na pata esquerda", observacoes: "bla", veterinario_id: 1, animal_id: 1},    
    {data_hora: "2024-06-30 22:06:30", sintomas: "Machucado na pata esquerda", observacoes: "", veterinario_id: 1, animal_id: 1},
    {data_hora: "2024-06-30 22:06:30", sintomas: "Machucado na pata esquerda", observacoes: "bla", veterinario_id: 1, animal_id: 1},
    {data_hora: "2024-06-30 20:52:31", sintomas: "Dor estomacal", observacoes: "", veterinario_id: 2, animal_id: 4},
    {data_hora: "2024-06-29 21:07:50", sintomas: "Febre e corisa", observacoes: "", veterinario_id: 3, animal_id: 5},
    {data_hora: "2024-06-29 15:32:03", sintomas: "Machucados na pele", observacoes: "Conferir prescrição médica", veterinario_id: 2, animal_id: 3},
    {data_hora: "2024-06-28 13:56:27", sintomas: "Fortes dores abdominais ao apertar a barriga", observacoes: "Conferir prescrição médica", veterinario_id: 1, animal_id: 2}
  ]
)

PrescricaoMedica.create(
[
  {descricao: "Paciente encaminhado para raio X.", consulta_id: 2},
  {descricao: "Ministrar rifocina no local do machucado.", consulta_id: 1},
  {descricao: "Paciente encaminhado para exame de FIV e FELV.", consulta_id: 4},
  {descricao: "Ministrar paracetamol uma vez ao dia durante 3 dias.", consulta_id: 3},
  {descricao: "Paciente encaminhado para ultrassonografia.", consulta_id: 5},
]
)

Internamento.create([
  { data_inicio: "2024-11-01", data_fim: "2024-11-05", observacoes: "Animal com problema respiratório", animal_id: 1, veterinario_id: 1 },
  { data_inicio: "2024-11-10", data_fim: "2024-11-15", observacoes: "Animal com suspeita de infecção", animal_id: 1, veterinario_id: 1 },
  { data_inicio: "2024-11-07", data_fim: "2024-11-09", observacoes: "Gato com dor abdominal", animal_id: 2, veterinario_id: 2 },
  { data_inicio: "2024-11-12", data_fim: "2024-11-14", observacoes: "Cachorro com problema de pele", animal_id: 4, veterinario_id: 3 },
  { data_inicio: "2024-11-20", data_fim: "2024-11-22", observacoes: "Papagaio com dificuldade respiratória", animal_id: 5, veterinario_id: 2 }
])

Estoque.create([
  {
    nome: 'Ibuprofeno',
    descricao: 'Anti-inflamatório e analgésico utilizado para reduzir febre e dor.',
    quantidade: 100,
    unidade_de_medida: 'comprimidos',
    data_de_validade: '2025-12-31',
    fornecedor: 'Farmacêutica XYZ',
    preco_de_compra: 12.50,
    localizacao: 'Prateleira A1',
    codigo_do_produto: 'MED001',
    categoria: 'Medicamentos',
    data_de_entrada: '2024-01-10'
  },
  {
    nome: 'Paracetamol',
    descricao: 'Analgésico e antipirético utilizado para tratar dores leves a moderadas.',
    quantidade: 200,
    unidade_de_medida: 'comprimidos',
    data_de_validade: '2025-11-30',
    fornecedor: 'Laboratórios ABC',
    preco_de_compra: 8.75,
    localizacao: 'Prateleira B2',
    codigo_do_produto: 'MED002',
    categoria: 'Medicamentos',
    data_de_entrada: '2024-02-15'
  },
  {
    nome: 'Amoxicilina',
    descricao: 'Antibiótico utilizado para tratar diversas infecções bacterianas.',
    quantidade: 150,
    unidade_de_medida: 'cápsulas',
    data_de_validade: '2025-10-31',
    fornecedor: 'Farmacêutica XYZ',
    preco_de_compra: 25.00,
    localizacao: 'Prateleira C3',
    codigo_do_produto: 'MED003',
    categoria: 'Medicamentos',
    data_de_entrada: '2024-03-20'
  },
  {
    nome: 'Omeprazol',
    descricao: 'Medicamento utilizado para tratar problemas de ácido gástrico.',
    quantidade: 80,
    unidade_de_medida: 'comprimidos',
    data_de_validade: '2026-01-31',
    fornecedor: 'Laboratórios ABC',
    preco_de_compra: 15.20,
    localizacao: 'Prateleira D4',
    codigo_do_produto: 'MED004',
    categoria: 'Medicamentos',
    data_de_entrada: '2024-04-05'
  },
  {
    nome: 'Cetoconazol',
    descricao: 'Antifúngico utilizado para tratar infecções fúngicas da pele.',
    quantidade: 60,
    unidade_de_medida: 'frascos',
    data_de_validade: '2026-05-31',
    fornecedor: 'Farmacêutica XYZ',
    preco_de_compra: 32.00,
    localizacao: 'Prateleira E5',
    codigo_do_produto: 'MED005',
    categoria: 'Medicamentos',
    data_de_entrada: '2024-05-10'
  }
])
