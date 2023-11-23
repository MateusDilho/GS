CREATE DATABASE IF NOT EXISTS fiap;
USE fiap;

CREATE TABLE Objetivos (
    id_objetivo VARCHAR(10) PRIMARY KEY,
    objetivo_global TEXT,
    objetivo_brasil TEXT
);

CREATE TABLE Indicadores (
    id_indicador VARCHAR(10) PRIMARY KEY,
    descricao TEXT,
    id_objetivo VARCHAR(10),
    FOREIGN KEY (id_objetivo) REFERENCES Objetivos(id_objetivo)
);

CREATE TABLE DadosIndicador (
    id_indicador VARCHAR(10),
    regiao_nome VARCHAR(255),
    taxa DOUBLE,
    ano INT,
    FOREIGN KEY (id_indicador) REFERENCES Indicadores(id_indicador)
);


INSERT INTO Objetivos VALUES 
('3.1', 'Até 2030, reduzir a taxa de mortalidade materna global para menos de 70 mortes por 100.000 nascidos vivos.', 'Até 2030, reduzir a razão de mortalidade materna para no máximo 30 mortes por 100.000 nascidos vivos.'),
('3.2', 'Até 2030, acabar com as mortes evitáveis de recém-nascidos e crianças menores de 5 anos, com todos os países objetivando reduzir a mortalidade neonatal para pelo menos 12 por 1.000 nascidos vivos e a mortalidade de crianças menores de 5 anos para pelo menos 25 por 1.000 nascidos vivos.', 'Até 2030, enfrentar as mortes evitáveis de recém-nascidos e crianças menores de 5 anos, objetivando reduzir a mortalidade neonatal para no máximo 5 por mil nascidos vivos e a mortalidade de crianças menores de 5 anos para no máximo 8 por mil nascidos vivos.'),
('3.3', 'Até 2030, acabar com as epidemias de AIDS, tuberculose, malária e doenças tropicais negligenciadas, e combater a hepatite, doenças transmitidas pela água, e outras doenças transmissíveis.', 'Até 2030 acabar, como problema de saúde pública, com as epidemias de AIDS, tuberculose, malária, hepatites virais, doenças negligenciadas, doenças transmitidas pela água, arboviroses transmitidas pelo aedes aegypti e outras doenças transmissíveis.'),
('3.4', 'Até 2030, reduzir em um terço a mortalidade prematura por doenças não transmissíveis via prevenção e tratamento, e promover a saúde mental e o bem-estar.', 'Até 2030, reduzir em um terço a mortalidade prematura por doenças não transmissíveis via prevenção e tratamento, promover a saúde mental e o bem-estar, a saúde do trabalhador e da trabalhadora, e prevenir o suicídio, alterando significativamente a tendência de aumento.'),
('3.5', 'Reforçar a prevenção e o tratamento do abuso de substâncias, incluindo o abuso de drogas entorpecentes e uso nocivo do álcool.', 'Reforçar a prevenção e o tratamento dos problemas decorrentes do uso de substâncias, incluindo o abuso de drogas entorpecentes e uso nocivo do álcool.'),
('3.6', 'Até 2020, reduzir pela metade as mortes e os ferimentos globais por acidentes em estradas.', 'Até 2030, reduzir pela metade as mortes e lesões por acidentes no trânsito.'),
('3.7', 'Até 2030, assegurar o acesso universal aos serviços de saúde sexual e reprodutiva, incluindo o planejamento familiar, informação e educação, bem como a integração da saúde reprodutiva em estratégias e programas nacionais.', 'Até 2030, assegurar o acesso universal aos serviços e insumos de saúde sexual e reprodutiva, incluindo o planejamento reprodutivo, à informação e educação, bem como a integração da saúde reprodutiva em estratégias e programas nacionais.'),
('3.8', 'Atingir a cobertura universal de saúde, incluindo a proteção do risco financeiro, o acesso a serviços de saúde essenciais de qualidade e o acesso a medicamentos e vacinas essenciais seguros, eficazes, de qualidade e a preços acessíveis para todos.', 'Assegurar, por meio do Sistema Único de Saúde (SUS), a cobertura universal de saúde, o acesso a serviços essenciais de saúde de qualidade em todos os níveis de atenção e o acesso a medicamentos e vacinas essenciais seguros, eficazes e de qualidade que estejam incorporados ao rol de produtos oferecidos pelo SUS.'),
('3.9', 'Até 2030, reduzir substancialmente o número de mortes e doenças por produtos químicos perigosos, contaminação e poluição do ar e água do solo.', 'Meta mantida sem alteração.'),
('3.a', 'Fortalecer a implementação da Convenção-Quadro para o Controle do Tabaco em todos os países, conforme apropriado.', 'Fortalecer a implementação da Convenção-Quadro para o Controle do Tabaco no Brasil.'),
('3.b', 'Apoiar a pesquisa e o desenvolvimento de vacinas e medicamentos para as doenças transmissíveis e não transmissíveis, que afetam principalmente os países em desenvolvimento, proporcionar o acesso a medicamentos e vacinas essenciais a preços acessíveis, de acordo com a Declaração de Doha, que afirma o direito dos países em desenvolvimento de utilizarem plenamente as disposições do acordo TRIPS sobre flexibilidades para proteger a saúde pública e, em particular, proporcionar o acesso a medicamentos para todos.', 'Apoiar a pesquisa e o desenvolvimento de tecnologias e inovações em saúde para as doenças transmissíveis e não transmissíveis, proporcionar o acesso a essas tecnologias e inovações incorporadas ao SUS, incluindo medicamentos e vacinas, a toda a população.'),
('3.c', 'Aumentar substancialmente o financiamento da saúde e o recrutamento, desenvolvimento e formação, e retenção do pessoal de saúde nos países em desenvolvimento, especialmente nos países menos desenvolvidos e nos pequenos Estados insulares em desenvolvimento.', 'Aumentar substancialmente o financiamento da saúde e o recrutamento, desenvolvimento, formação e retenção do pessoal de saúde, especialmente nos territórios mais vulneráveis.'),
('3.d', 'Reforçar a capacidade de todos os países, particularmente os países em desenvolvimento, para o alerta precoce, redução de riscos e gerenciamento de riscos nacionais e globais de saúde.', 'Reforçar as capacidades locais para o alerta precoce, redução e gerenciamento de emergências e riscos nacionais e globais de saúde.');


INSERT INTO Indicadores VALUES
('3.1.1', 'Razão de mortalidade materna', '3.1'),
('3.1.2', 'Proporção de nascimentos assistidos por profissional de saúde qualificado', '3.1');


INSERT INTO DadosIndicador VALUES
('3.1.1', 'Brasil', 61.8, 2011),
('3.1.1', 'Brasil', 59.3, 2012),
('3.1.1', 'Norte', 74.7, 2011),
('3.1.1', 'Norte', 73.2, 2012),
('3.1.1', 'Rondônia', 58.3, 2011),
('3.1.1', 'Rondônia', 64.1, 2012),
('3.1.1', 'Acre', 33.7, 2011),
('3.1.1', 'Acre', 53.9, 2012),
('3.1.1', 'Amazonas', 84.6, 2011),
('3.1.1', 'Amazonas', 85, 2012),
('3.1.1', 'Roraima', 67.5, 2011),
('3.1.1', 'Roraima', 38, 2012),
('3.1.1', 'Pará', 73.8, 2011),
('3.1.1', 'Pará', 78.9, 2012),
('3.1.1', 'Amapá', 53.3, 2011),
('3.1.1', 'Amapá', 54.1, 2012),
('3.1.1', 'Tocantins', 112.6, 2011),
('3.1.1', 'Tocantins', 53.3, 2012);
