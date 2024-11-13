-- creation de la database
CREATE DATABASE Centre_de_formation ;

-- creation de la table etudiant
CREATE TABLE Etudiant ( NumEtu INT PRIMARY KEY, NomEtu VARCHAR(50), 
    PrenomEtu VARCHAR(50), dateNaissance DATE, adresseEtu VARCHAR(100), 
    villeEtu VARCHAR(50), niveauEtu INT );

--creation de la table session et Ajout d'une contrainte CHECK: dateFin doit toujours être supérieure à dateDebut.
CREATE TABLE Session ( codeSess INT PRIMARY KEY, nomSess VARCHAR(50), 
    typeCours VARCHAR(50) NOT NULL, dateDebut DATE, dateFin DATE, codeForm INT, 
    FOREIGN KEY (codeForm) REFERENCES Formation(codeForm), CHECK (dateFin > dateDebut)  ); 

-- creation de la table specialite et Ajout d'une colonne « Active » 
CREATE TABLE Specialite ( codeSpec INT PRIMARY KEY, nomSpec VARCHAR(50), 
descSpec TEXT, Active BOOLEAN DEFAULT 1 );

-- creation de la table formation
CREATE TABLE Formation ( codeForm INT PRIMARY KEY, titreForm VARCHAR(50),
 dureeForm INT, prixForm DECIMAL ); 

-- creation de la table inscription et Ajout d'une contrainte NOT NULL sur la colonne typeCours 
CREATE TABLE Inscription (numEtu INT, codeSession INT, typeInscription VARCHAR(50) NOT NULL,
  codeConcerne INT, PRIMARY KEY (numEtu, codeSession), FOREIGN KEY (numEtu) REFERENCES Etudiant(numEtu),
  FOREIGN KEY (codeSession) REFERENCES Session(codeSession) );

-- creation de la table appartient
CREATE TABLE Appartient ( codeSpec INT, codeForm INT, PRIMARY KEY (codeSpec, codeForm),
    FOREIGN KEY (codeSpec) REFERENCES Specialite(codeSpec), FOREIGN KEY (codeForm) REFERENCES Formation(codeForm) );
