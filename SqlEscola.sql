CREATE database escola;

CREATE TABLE Aluno (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Matricula INT,
    Email VARCHAR(50),
    Endereco VARCHAR(50),
    Telefone VARCHAR(15)
);

INSERT INTO Aluno (ID, Nome, Matricula, Email, Endereco, Telefone) VALUES
(1, 'João Carlos', 1234, 'Jcarlos@gmail.com', 'Rua 13 de maio', '(11)7825-4489'),
(2, 'José Vitor', 2345, 'Jvitor@gmail.com', 'Rua da Saudade', '(11)7825-6589'),
(3, 'Paulo André', 3456, 'Pandr@gmail.com', 'Rua do Sol', '(11)7825-4495');

CREATE TABLE Emprestimo (
    Codigo INT PRIMARY KEY,
    Data_hora DATETIME,
    Matric_Aluno INT,
    Data_devolucao DATE,
    FOREIGN KEY (Matric_Aluno) REFERENCES Aluno(Matricula)
);

INSERT INTO Emprestimo (Codigo, Data_hora, Matric_Aluno, Data_devolucao) VALUES
(1, '2022-03-12 15:25', 1234, '2022-03-15'),
(2, '2022-03-15 14:32', 3456, '2022-03-18'),
(3, '2022-03-20 03:51', 2345, '2022-03-23')

SELECT * FROM Aluno;
SELECT * FROM Emprestimo;