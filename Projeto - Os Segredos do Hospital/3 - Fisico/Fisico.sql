-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Enfermeiro (
Nome VARCHAR(10),
CPF VARCHAR(10),
CRE VARCHAR(10),
ID VARCHAR(10) PRIMARY KEY
)

CREATE TABLE Tipo de Quarto (
ID VARCHAR(10) PRIMARY KEY,
Valor da Diária VARCHAR(10),
Descrição VARCHAR(10)
)

CREATE TABLE Quarto (
ID  VARCHAR(10) PRIMARY KEY,
Número VARCHAR(10),
Tipo VARCHAR(10)
)

CREATE TABLE Possui (
ID  VARCHAR(10),
ID VARCHAR(10),
FOREIGN KEY(ID ) REFERENCES Quarto (ID),
FOREIGN KEY(ID) REFERENCES Tipo de Quarto (ID)
)

CREATE TABLE Ocupa (
ID  VARCHAR(10),
ID VARCHAR(10),
FOREIGN KEY(ID ) REFERENCES Quarto (ID)
)

CREATE TABLE Requer (
ID VARCHAR(10),
-- Erro: nome do campo duplicado nesta tabela!
ID VARCHAR(10),
FOREIGN KEY(ID) REFERENCES Enfermeiro (ID)
)

CREATE TABLE MÉDICO+CONSULTA (
CRM VARCHAR(10),
Especialidade VARCHAR(10),
Nome do Médico VARCHAR(10),
Data VARCHAR(10),
-- Erro: nome do campo duplicado nesta tabela!
Nome do Médico VARCHAR(10),
Horário VARCHAR(10),
-- Erro: nome do campo duplicado nesta tabela!
CRM VARCHAR(10),
-- Erro: nome do campo duplicado nesta tabela!
Especialidade VARCHAR(10),
Convênio VARCHAR(10),
PRIMARY KEY(CRM,Data)
)

CREATE TABLE Dados do Paciente (
CPF NUMERIC(10),
Ficha do Paciente VARCHAR(10)
)

CREATE TABLE HOSPITAL (
Ficha do Paciente VARCHAR(10) PRIMARY KEY,
Doc. Identificação NUMERIC(10),
CRM VARCHAR(10),
Data VARCHAR(10),
FOREIGN KEY(Data,,) REFERENCES MÉDICO+CONSULTA (CRM,Data)
)

CREATE TABLE ESPECIALIDADE (
Dias de Atendimento NUMERIC(10),
Médico VARCHAR(10),
CRM NUMERIC(10),
ID M. Especialista VARCHAR(10) PRIMARY KEY
)

-- Erro: Nome de tabela duplicado (este erro compromete a integridade referencial)!
CREATE TABLE Dados do Paciente (
Ficha do Paciente VARCHAR(10),
ID Convênio VARCHAR(10),
FOREIGN KEY(Ficha do Paciente) REFERENCES HOSPITAL (Ficha do Paciente)
)

CREATE TABLE CONVÊNIO (
Nº Carterinha NUMERIC(10),
Nome do Convênio VARCHAR(10),
CNPJ NUMERIC(10),
Data de Vencimento NUMERIC(10),
ID Convênio VARCHAR(10) PRIMARY KEY
)

-- Erro: Nome de tabela duplicado (este erro compromete a integridade referencial)!
CREATE TABLE Possui (
CRM VARCHAR(10),
Data VARCHAR(10),
ID M. Especialista VARCHAR(10),
Solicitação Médica VARCHAR(10),
PRIMARY KEY(CRM,Data,ID M. Especialista,Solicitação Médica)
)

CREATE TABLE PACIENTE (
CPF NUMERIC(10) PRIMARY KEY,
Nome Completo VARCHAR(10),
E-mail VARCHAR(10),
Telefone NUMERIC(10),
Endereço VARCHAR(10),
Data de Nascimento NUMERIC(10),
RG NUMERIC(10)
)

CREATE TABLE Exame (
Solicitação Médica VARCHAR(10) PRIMARY KEY,
Data da Solicitação VARCHAR(10),
Tipo de Exame VARCHAR(10),
ID VARCHAR(10)
)

CREATE TABLE Internação (
Data de Entrada VARCHAR(10),
Data da Alta VARCHAR(10),
Procedimento VARCHAR(10),
ID VARCHAR(10) PRIMARY KEY
)

ALTER TABLE Ocupa ADD FOREIGN KEY(ID) REFERENCES Internação (ID)
ALTER TABLE Requer ADD FOREIGN KEY(ID) REFERENCES Internação (ID)
ALTER TABLE Dados do Paciente ADD FOREIGN KEY(CPF) REFERENCES PACIENTE (CPF)
ALTER TABLE Dados do Paciente ADD FOREIGN KEY(Ficha do Paciente) REFERENCES HOSPITAL (Ficha do Paciente)
ALTER TABLE Dados do Paciente ADD FOREIGN KEY(ID Convênio) REFERENCES CONVÊNIO (ID Convênio)
ALTER TABLE Exame ADD FOREIGN KEY(ID) REFERENCES Internação (ID)
