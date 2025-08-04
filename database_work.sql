create database empresa;

create table departamentos (
    id serial primary key,
    nome varchar(100) not null,
    descricao text,
    criado_em timestamp
);

create table funcionarios (
    id serial primary key,
    nome varchar(100) not null,
    idade int,
    salario numeric(10,2),
    ativo boolean default true,
    data_contratacao date,
    habilidades text[],
    cargo varchar(50)
);

create table projetos (
    id serial primary key,
    nome varchar(100) not null,
    departamento_id int,
    responsavel_id int,
    orcamento numeric(12,2),
    concluido boolean default false
);

alter table projetos
    add constraint fk_departamento
    foreign key (departamento_id)
    references departamentos(id)
    on delete cascade;

alter table projetos
    add constraint fk_responsavel
    foreign key (responsavel_id)
    references funcionarios(id)
    on delete set null;

insert into departamentos (nome, descricao, criado_em)
values
('tecnologia', 'responsável por sistemas e infraestrutura', '2023-01-10 09:30:00'),
('recursos humanos', 'gestão de pessoas e contratações', '2023-02-15 14:45:00'),
('financeiro', 'controle de orçamentos e pagamentos', '2023-03-20 11:20:00'),
('marketing', 'divulgação e campanhas publicitárias', '2023-04-05 16:10:00'),
('operações', 'controle de processos e produção', '2023-05-12 08:50:00');

insert into funcionarios (nome, idade, salario, ativo, data_contratacao, habilidades, cargo)
values
('ana silva', 29, 4500.00, true, '2022-03-01', array['python','sql'], 'analista de sistemas'),
('bruno costa', 35, 6000.00, true, '2020-07-15', array['liderança','comunicação'], 'gerente de projetos'),
('carla souza', 41, 7200.00, true, '2018-01-20', array['excel','financeiro'], 'analista financeiro'),
('daniel rocha', 26, 3500.00, true, '2023-05-10', array['redes sociais','seo'], 'assistente de marketing'),
('eduardo lima', 38, 8000.00, true, '2019-09-01', array['logística','planejamento'], 'coordenador de operações');

insert into projetos (nome, departamento_id, responsavel_id, orcamento, concluido)
values
('sistema de vendas online', 1, 1, 50000.00, false),
('campanha de divulgação 2025', 4, 4, 15000.00, false),
('reestruturação financeira', 3, 3, 25000.00, true),
('treinamento de novos funcionários', 2, 2, 8000.00, false),
('otimização da linha de produção', 5, 5, 40000.00, false);

--Toeldos
--Igor:
update funcionarios
set salario = 7500
where id = 5;

update projetos
set concluido = true
where id = 5;

delete funcionarios
where id = 4;

delete projetos
where id = 2;





