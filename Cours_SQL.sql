DROP CREATE DATABASE Ecole;

CREATE DATABASE Ecole;

USE Ecole;

CREATE TABLE Etudiant(
id int primary key, 
nom varchar(10),
prenom varchar(30),
age int
);
insert into Etudiant values(1,"Mboumba","Don_de_Dieu",15);
insert into Etudiant values(2,"Motaba","Gil",19);
insert into Etudiant values(3,"NGoma","Naomie",18,"Point_E","BSID2");
insert into Etudiant values(4,"Mohamed","Faye",17,"Ouakam","BSID2");
insert into Etudiant values(5,"Camara","Saiba",20,"Sacre_coeur","BSID1");


ALTER TABLE Etudiant ADD adresse varchar(15);

Update Etudiant set adresse="Sacre_coeur" where id = 1;
Update Etudiant set adresse="Liberty_6" where id = 2;

DROP CREATE TABLE Classe;

CREATE TABLE Classe(
idclasse int primary key,
designation varchar(30)
);
--Modifier la description
ALTER TABLE Classe MODIFY idclasse  varchar(15);

-- Créer les classes BSID1 et BSID2.
insert into Classe values ("BSID1","Premiere annee_BSID");
insert into Classe values ("BSID2","Deuxieme annee_BSID");

ALTER TABLE Etudiant ADD idclasse varchar(15);
ALTER TABLE Etudiant ADD CONSTRAINT fk_classe FOREIGN KEY(idclasse) REFERENCES Classe(idclasse);

--//Update Etudiant set idclasse=1 where id=1;
--//Update Etudiant set idclasse=2 where id=2;

CREATE TABLE Enseignant(
idEseignant int primary key,
nom varchar(10),
prenom varchar(30),
age int
);

CREATE TABLE Enseigner(
id int,
idEseignant int,
primary key(id, idEseignant),
FOREIGN KEY(id) REFERENCES Etudiant(id),
FOREIGN KEY(idEseignant) REFERENCES Enseignant(idEseignant)
);

ALTER TABLE Enseignant ADD matiere varchar(30);
 
--Inserer des enseignants dans la table
insert into Enseignant values(1,"Loemba","Danielle",54);
Update Enseignant set matiere="Maths" where idEseignant = 1;
insert into Enseignant values(10,"SOW","Amadou",54,"Programmation");
insert into Enseignant values(11,"Fall","Aicha",54,"Economie");

--Inscrire les 2 étudiant au cours de l'enseignant 1, 10 et 11.
insert into Enseigner values(1,1);
insert into Enseigner values(2,1);
insert into Enseigner values(2,11);
insert into Enseigner values(3,10);
insert into Enseigner values(4,1);
insert into Enseigner values(5,11);

 --Suite le 18 Javier
 --2.Modifier
ALTER TABLE Etudiant CHANGE age codepostal varchar(15);

--3.Lister tous les etudiants par ordre alphabetique de nom de famille
--Ordre descroissante
select*from Etudiant order by nom desc;
--Ordre croissante
select*from Etudiant order by nom asc;

--4.Lister tous les enseignants de nom SOW ou Fallselect id, nom, prenom from Enseigner where idEseignant=1;
select*from Enseignant where nom="SOW" or nom="Fall";
select*from Enseignant where nom="SOW"

--5.Le nombre d'étudiants inscrit au cours de l'enseignant 1
select*from Enseigner where idEseignant=1;
select count(*) from Enseigner where idEseignant=1;
select id, nom, prenom from Enseigner where idEseignant=1;
--Application 2(le 18 janvier)

DROP CREATE DATABASE Application;
CREATE DATABASE Application;

USE Application;

CREATE TABLE Client(
numeroClient int primary key,
nom varchar(15),
sexe enum ("M","F"),
ville varchar(30),
code_postal int,
Telephone varchar(20)
);

CREATE TABLE Voiture(
numeroImmat int primary key,
marque varchar(20),
modele varchar(20),
annee date,
numeroClient int,
FOREIGN KEY(numeroClient) REFERENCES Client(numeroClient)
);

CREATE TABLE Reparation(
numeroRepa int primary key,
PHT int,
KM varchar(19),
numeroImmat int,
FOREIGN KEY(numeroImmat) REFERENCES Voiture(numeroImmat)
);
insert into Client values(1,"Mboumba","M","Dakar",221,"77 510 32 75");
insert into Client values(2,"Motaba","M","Brazza",242,"05 593 82 01");
insert into Client values(3,"NGoma","F","Libreville",243,"06 510 32 75");

insert into Voiture values(901,"TOYOTA","Corolla hybride","02/04/2021",3);
insert into Voiture values(912,"Renault","Arkana","9/07/2022",1);
insert into Voiture values(914,"Jeep","Compass","02/10/2023",2);

insert into Reparation values(12,750000,"406km",912);
insert into Reparation values(13,105000,"200km",914);
insert into Reparation values(14,65000,"350km",901);

select numeroImmat from Voiture;




--Revision
CREATE DATABASE Examen;

USE Examen;

CREATE TABLE Etudiant(
idEtudiant int primary key,
nom varchar(15),
prenom varchar(15),
classe varchar(15),
date_de_Naissance date,
sexe enum ("H","F"),
email varchar(35),
adresse varchar(35)
);

CREATE TABLE Evaluation(
idEvaluation int primary key,
typeEval varchar(20),
matiere varchar(20),
dateEval date
);

CREATE TABLE Participer(
idEtudiant int,
idEvaluation int,
primary key(idEtudiant, idEvaluation),
FOREIGN KEY(idEtudiant) REFERENCES Etudiant(idEtudiant),
FOREIGN KEY(idEvaluation) REFERENCES Evaluation(idEvaluation),
note int
);

insert into Etudiant values(1,"Mboumba","Don_de_Dieu","BSID2","2002/04/02","H","dondedieu.mboumba@gmail.com","Liberty_6");
insert into Etudiant values(2,"Mboungou","De_Dieu","BSID1","2005/04/02","H","dedieu.mboungou@gmail.com","Point_E");
insert into Etudiant values(3,"Camara","Mouhamed","BSID2","2003/12/31","H","saiba@gmail.com","Sedima");
insert into Etudiant values(4,"Motaba","Gil","BSID2","2004/05/02","H","motabagil@gmail.com","Mont_Kamba"); 
insert into Etudiant values(5,"NGoma","Naomie","BSID1","2002/07/02","F","Gift_of_God@gmail.com","Libreville");




--1)La liste des etudiants
select*from Etudiant;
--2)La lister des evaluations
select*from Evaluation;
--3)Le nombre total d'etudiants
select count(*) from Etudiant;
--4)Le nombre total d'etudiants par classe
select count(*) from