#-------#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Roles
#------------------------------------------------------------

CREATE TABLE Roles(
  id_Role               Int  Auto_increment  NOT NULL ,
  nom_Role              Varchar (50) NOT NULL ,
  gestionPrivilege_Role Boolean NOT NULL ,
  gestionBoutique_Role  Boolean NOT NULL ,
  gestionCMS_Role       Boolean NOT NULL
  ,CONSTRAINT Roles_PK PRIMARY KEY (id_Role)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Statuts
#------------------------------------------------------------

CREATE TABLE Statuts(
  id_Statut                       Int  Auto_increment  NOT NULL ,
  type_Statut                     Varchar (50) NOT NULL ,
  reductionSoutienScolaire_Statut Float NOT NULL ,
  reductionFormation_Statut       Float NOT NULL ,
  reductionLogement_Statut        Float NOT NULL ,
  reductionEmploi_Statut          Float NOT NULL ,
  reductionDepannage_Statut       Float NOT NULL ,
  reductionConseil_Statut         Float NOT NULL ,
  reductionPC_Statut              Float NOT NULL ,
  reductionActivite_Statut        Float NOT NULL ,
  reductionCyber_Statut           Float NOT NULL
  ,CONSTRAINT Statuts_PK PRIMARY KEY (id_Statut)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Users
#------------------------------------------------------------

CREATE TABLE Users(
  id_Users           Int  Auto_increment  NOT NULL ,
  nom_Users          Varchar (50) NOT NULL ,
  prenom_Users       Varchar (50) NOT NULL ,
  mail_Users         Varchar (100) NOT NULL ,
  adresse_Users      Varchar (200) NOT NULL ,
  tel_Users          Varchar (12) NOT NULL ,
  file_Users         Varchar (50) ,
  dateCreation_Users Datetime NOT NULL ,
  dateUpdate_Users   Datetime NOT NULL ,
  dateLastCo_Users   Datetime NOT NULL ,
  password_Users     Varchar (256) NOT NULL ,
  validateStatut_Users Boolean NOT NULL,
  id_Role            Int NOT NULL ,
  id_Statut          Int NOT NULL
  ,CONSTRAINT Users_PK PRIMARY KEY (id_Users)

  ,CONSTRAINT Users_Roles_FK FOREIGN KEY (id_Role) REFERENCES Roles(id_Role)
  ,CONSTRAINT Users_Statuts0_FK FOREIGN KEY (id_Statut) REFERENCES Statuts(id_Statut)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commandes
#------------------------------------------------------------

CREATE TABLE Commandes(
  id_Commande       Int  Auto_increment  NOT NULL ,
  paiement_Commande Varchar (50) NOT NULL ,
  date_Commande     Datetime NOT NULL ,
  prix_Commande     Decimal (5) NOT NULL ,
  remise_Commande   Int NOT NULL ,
  id_Users          Int NOT NULL
  ,CONSTRAINT Commandes_PK PRIMARY KEY (id_Commande)

  ,CONSTRAINT Commandes_Users_FK FOREIGN KEY (id_Users) REFERENCES Users(id_Users)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CatePages
#------------------------------------------------------------

CREATE TABLE CatePages(
  id_CatePage  Int  Auto_increment  NOT NULL ,
  nom_CatePage Varchar (50) NOT NULL
  ,CONSTRAINT CatePages_PK PRIMARY KEY (id_CatePage)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Pages
#------------------------------------------------------------

CREATE TABLE Pages(
  id_Page         Int  Auto_increment  NOT NULL ,
  titre_Page      Varchar (40) NOT NULL ,
  contenu_Page    Varchar (24000) NOT NULL ,
  dateUpdate_Page Datetime NOT NULL ,
  id_CatePage     Int NOT NULL
  ,CONSTRAINT Pages_PK PRIMARY KEY (id_Page)

  ,CONSTRAINT Pages_CatePages_FK FOREIGN KEY (id_CatePage) REFERENCES CatePages(id_CatePage)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PagesBackUp
#------------------------------------------------------------

CREATE TABLE PagesBackUp(
  id_PageBackUp      Int  Auto_increment  NOT NULL ,
  version_PageBackUp Int NOT NULL ,
  titre_Page         Varchar (40) NOT NULL ,
  contenu_Page       Varchar (24000) NOT NULL ,
  dateArchive_Page   Datetime NOT NULL ,
  id_Page            Int NOT NULL ,
  id_CatePage        Int NOT NULL
  ,CONSTRAINT PagesBackUp_PK PRIMARY KEY (id_PageBackUp)

  ,CONSTRAINT PagesBackUp_Pages_FK FOREIGN KEY (id_Page) REFERENCES Pages(id_Page)
  ,CONSTRAINT PagesBackUp_CatePages0_FK FOREIGN KEY (id_CatePage) REFERENCES CatePages(id_CatePage)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Categories
#------------------------------------------------------------

CREATE TABLE Categories(
  id_Categorie  Int  Auto_increment  NOT NULL ,
  nom_Categorie Varchar (50) NOT NULL,
  tag_Categorie Varchar (50)
  ,CONSTRAINT Categories_PK PRIMARY KEY (id_Categorie)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Marques
#------------------------------------------------------------

CREATE TABLE Marques(
  id_Marque  Int  Auto_increment  NOT NULL ,
  nom_Marque Varchar (50) NOT NULL
  ,CONSTRAINT Marques_PK PRIMARY KEY (id_Marque)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Produits
#------------------------------------------------------------

CREATE TABLE Produits(
  id_Produit        Int  Auto_increment  NOT NULL ,
  nom_Produit       Varchar (50) NOT NULL ,
  prix_Produit      Float NOT NULL ,
  image_Produit     Varchar (50) ,
  descri_Produit    Varchar (500) NOT NULL ,
  stock_Produit     Int NOT NULL ,
  dateAjout_Produit Datetime NOT NULL ,
  id_Categorie      Int NOT NULL,
  id_Marque         Int NOT NULL
  ,CONSTRAINT Produits_PK PRIMARY KEY (id_Produit)

  ,CONSTRAINT Produits_Categories_FK FOREIGN KEY (id_Categorie) REFERENCES Categories(id_Categorie)
  ,CONSTRAINT Produits_Marques_FK FOREIGN KEY (id_Marque) REFERENCES Marques(id_Marque)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: OrdinateurFixe
#------------------------------------------------------------

CREATE TABLE OrdinateurFixe(
  id_Produit             Int NOT NULL ,
  os_OrdinateurFixe      Varchar (50) NOT NULL ,
  proc_OrdinateurFixe    Varchar (50) NOT NULL ,
  ram_OrdinateurFixe     Varchar (50) NOT NULL ,
  memoire_OrdinateurFixe Varchar (50) NOT NULL ,
  nbUsb_OrdinateurFixe   Int NOT NULL ,
  cable_OrdinateurFixe   Varchar (50) NOT NULL
  ,CONSTRAINT OrdinateurFixe_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT OrdinateurFixe_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: OrdinateurPort
#------------------------------------------------------------

CREATE TABLE OrdinateurPort(
  id_Produit                 Int NOT NULL ,
  os_OrdinateurPort          Varchar (50) NOT NULL ,
  proc_OrdinateurPort        Varchar (50) NOT NULL ,
  ram_OrdinateurPort         Varchar (50) NOT NULL ,
  memoire_OrdinateurPort     Varchar (50) NOT NULL ,
  tailleEcran_OrdinateurPort Varchar (50) NOT NULL ,
  nbUsb_OrdinateurPort       Varchar (50) NOT NULL ,
  cable_OrdinateurPort       Varchar (50) NOT NULL
  ,CONSTRAINT OrdinateurPort_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT OrdinateurPort_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Souris
#------------------------------------------------------------

CREATE TABLE Souris(
  id_Produit        Int NOT NULL ,
  type_Souris       Varchar (50) NOT NULL ,
  dpi_Souris        Int ,
  nbBouton_Souris   Int
  ,CONSTRAINT Souris_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Souris_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CleUSB
#------------------------------------------------------------

CREATE TABLE CleUSB(
  id_Produit        Int NOT NULL ,
  type_Cle          Varchar (50) NOT NULL ,
  taille_Cle        Int NOT NULL
  ,CONSTRAINT CleUSB_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT CleUSB_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: LecteurUSB
#------------------------------------------------------------

CREATE TABLE LecteurUSB(
  id_Produit        Int NOT NULL ,
  type_Lecteur      Varchar (50) NOT NULL ,
  vitesse_Lecteur   Int
  ,CONSTRAINT LecteurUSB_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT LecteurUSB_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cable
#------------------------------------------------------------

CREATE TABLE Cable(
  id_Produit        Int NOT NULL ,
  longueur_Cable    Int NOT NULL ,
  type_Cable        Varchar (50) NOT NULL
  ,CONSTRAINT Cable_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Cable_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: HautParleur
#------------------------------------------------------------

CREATE TABLE HautParleur(
  id_Produit        Int NOT NULL ,
  cable_HP          Varchar (50) NOT NULL ,
  puissance_HP      Varchar (50) ,
  alimentation_HP   Varchar (50) ,
  resis_HP          Varchar (50) ,
  debit_HP          Varchar (50)
  ,CONSTRAINT HautParleur_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT HautParleur_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ecran
#------------------------------------------------------------

CREATE TABLE Ecran(
  id_Produit        Int NOT NULL ,
  taille_Ecran      Int NOT NULL ,
  cable_Ecran       Varchar (50) NOT NULL
  ,CONSTRAINT Ecran_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Ecran_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Clavier
#------------------------------------------------------------

CREATE TABLE Clavier(
  id_Produit        Int NOT NULL ,
  cable_Clavier     Varchar (50) NOT NULL ,
  type_clavier      Varchar (50) NOT NULL
  ,CONSTRAINT Clavier_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Clavier_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Telephone
#------------------------------------------------------------

CREATE TABLE Telephone(
  id_Produit        Int NOT NULL ,
  type_Tel          Varchar (50) NOT NULL ,
  tailleEcran_Tel   Int NOT NULL ,
  os_Tel            Varchar (50) NOT NULL ,
  typeSim_Tel       Varchar (50) NOT NULL ,
  proc_Tel          Varchar (50) ,
  sd_Tel            Varchar (50) ,
  photo_Tel         Varchar (50) ,
  ram_Tel           Varchar (50) ,
  rom_Tel           Varchar (50) ,
  batterie_Tel      Varchar (50) ,
  couleur_Tel       Varchar (50)
  ,CONSTRAINT Telephone_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Telephone_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Tablette
#------------------------------------------------------------

CREATE TABLE Tablette(
  id_Produit        Int NOT NULL ,
  tailleEcran_Tablette   Int NOT NULL ,
  os_Tablette            Varchar (50) NOT NULL ,
  proc_Tablette          Varchar (50) ,
  sd_Tablette            Varchar (50) ,
  photo_Tablette         Varchar (50) ,
  ram_Tablette           Varchar (50) ,
  rom_Tablette           Varchar (50) ,
  batterie_Tablette      Varchar (50) ,
  couleur_Tablette       Varchar (50)
  ,CONSTRAINT Tablette_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Tablette_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: DisqueDur
#------------------------------------------------------------

CREATE TABLE DisqueDur(
  id_Produit        Int NOT NULL ,
  type_Disque       Varchar (50) NOT NULL ,
  usb_Disque        Varchar (50) NOT NULL,
  taille_Disque     Int NOT NULL
  ,CONSTRAINT DisqueDur_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT DisqueDur_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CarteSD
#------------------------------------------------------------

CREATE TABLE CarteSD(
  id_Produit        Int NOT NULL ,
  taille_Sd         Int NOT NULL ,
  type_Sd           Varchar (50) NOT NULL ,
  adapateur_Sd      Varchar (50)
  ,CONSTRAINT CarteSD_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT CarteSD_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CleWifi
#------------------------------------------------------------

CREATE TABLE CleWifi(
  id_Produit        Int NOT NULL ,
  typeCle_Wifi      Varchar (50) NOT NULL ,
  vitesse_Wifi      Varchar (50) NOT NULL
  ,CONSTRAINT CleWifi_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT CleWifi_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Imprimante
#------------------------------------------------------------

CREATE TABLE Imprimante(
  id_Produit        Int NOT NULL ,
  wifi_Imprimante   Varchar (50)
  ,CONSTRAINT Imprimante_PK PRIMARY KEY (id_Produit)
  ,CONSTRAINT Imprimante_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CommandesDetails
#------------------------------------------------------------

CREATE TABLE CommandesDetails(
  id_Produit  Int NOT NULL ,
  id_Commande Int NOT NULL
  ,CONSTRAINT CommandesDetails_PK PRIMARY KEY (id_Produit,id_Commande)

  ,CONSTRAINT CommandesDetails_Produits_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
  ,CONSTRAINT CommandesDetails_Commandes0_FK FOREIGN KEY (id_Commande) REFERENCES Commandes(id_Commande)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Avis
#------------------------------------------------------------

CREATE TABLE Avis(
  id_Users         Int NOT NULL ,
  id_Produit       Int NOT NULL ,
  commentaire_Avis Varchar (255) NOT NULL ,
  note_Avis        Int NOT NULL
  ,CONSTRAINT Avis_PK PRIMARY KEY (id_Users,id_Produit)

  ,CONSTRAINT Avis_Users_FK FOREIGN KEY (id_Users) REFERENCES Users(id_Users)
  ,CONSTRAINT Avis_Produits0_FK FOREIGN KEY (id_Produit) REFERENCES Produits(id_Produit)
)ENGINE=InnoDB;


INSERT INTO `statuts` (`id_Statut`, `type_Statut`, `reductionSoutienScolaire_Statut`, `reductionFormation_Statut`, `reductionLogement_Statut`, `reductionEmploi_Statut`, `reductionDepannage_Statut`, `reductionConseil_Statut`, `reductionPC_Statut`, `reductionActivite_Statut`, `reductionCyber_Statut`) VALUES (NULL, 'CPAS', '0.66', '0.625', '0.625', '0.625', '0.50', '0.625', '0.50', '0.625', '0.66'), (NULL, 'Chomage', '0.66', '0.50', '0.50', '0.50', '0.42', '0.50', '0.40', '0.50', '0.66'), (NULL, '-1250', '0.66', '0.50', '0.50', '0.50', '0.42', '0.50', '0.40', '0.50', '0.66'), (NULL, '-1750', '0.33', '0.375', '0.375', '0.375', '0.33', '0.375', '0.30', '0.375', '0.33'), (NULL, 'Etudiant', '0.33', '0.375', '0.375', '0.375', '0.33', '0.375', '0.30', '0.375', '0.33'), (NULL, 'ASBL', '0.33', '0.375', '0.375', '0.375', '0.33', '0.375', '0.30', '0.375', '0.33'), (NULL, '-2250', '0.33', '0.25', '0.25', '0.25', '0.25', '0.25', '0.20', '0.25', '0.33'), (NULL, 'Famille nombreuse', '0.33', '0.25', '0.25', '0.25', '0.25', '0.25', '0.20', '0.25', '0.33'), (NULL, '-2750', '0', '0.125', '0.125', '0.125', '0.15', '0.125', '0.10', '0.125', '0'), (NULL, '+2750', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `roles` (`id_Role`, `nom_Role`, `gestionPrivilege_Role`, `gestionBoutique_Role`, `gestionCMS_Role`) VALUES (NULL, 'User', '0', '0', '0'),  (NULL, 'BoutiqueManager', '0', '1', '0'), (NULL, 'Admin', '0', '1', '1'), (NULL, 'SuperAdmin', '1', '1', '1');
INSERT INTO `users` (`id_Users`, `nom_Users`, `prenom_Users`, `mail_Users`, `adresse_Users`, `tel_Users`, `dateCreation_Users`, `dateUpdate_Users`, `dateLastCo_Users`, `password_Users`, `validateStatut_Users`, `id_Role`, `id_Statut`) VALUES (NULL, 'Test', 'test', 'test.test@test.fr', 'test, rue de test, TEST', '0121325465', '2018-12-06 00:00:00', '2018-12-06 00:00:00', '2018-12-06 00:00:00', '51abb9636078defbf888d8457a7c76f85c8f114c', '0', '4', '6'), (NULL, 'LaFrite', 'Jacky', 'jacky.latitefrite@ketchup.fr', '87 rue de la musique pourrie, MonQul 69666', '0101010101', '2018-12-06 00:00:00', '2018-12-06 00:00:00', '2018-12-06 00:00:00', '51abb9636078defbf888d8457a7c76f85c8f114c', '0', '4', '2'), (NULL, 'Dupont', 'Gérard', 'pierrelouis.rousselot1test@orange.fr', '7854 vallée du pont cassé, 74123 Ponperdu', '0514789636', '2018-12-06 00:00:00', '2018-12-06 00:00:00', '2018-12-06 00:00:00', '51abb9636078defbf888d8457a7c76f85c8f114c', '0', '4', '6');
INSERT INTO `catepages` (`id_CatePage`, `nom_CatePage`) VALUES (NULL, 'Services'), (NULL, 'Informatique'), (NULL, 'Formations');
INSERT INTO `pages` (`id_Page`, `titre_Page`, `contenu_Page`, `dateUpdate_Page`, `id_CatePage`) VALUES (NULL, 'Soutien scolaire', '<h1>Soutien Scolaire</h1>', '2018-12-06 00:00:00', '1'), (NULL, 'Formation', '<h1> Formation </h1>', '2018-12-13 00:00:00', '3'),(NULL, 'Logement', '<h1>Aide au logement</h1>', '2018-12-06 00:00:00', '1'), (NULL, 'Cyber', '<h1>Cyber</h1>', '2018-12-06 00:00:00', '2'), (NULL, 'Réparations', '<h1>Réparations</h1>', '2018-12-06 00:00:00', '2'), (NULL, 'Maintenance', '<h1>Maintenance</h1>', '2018-12-06 00:00:00', '2');
INSERT INTO `categories` (`id_Categorie`, `nom_Categorie`, `tag_Categorie`) VALUES (NULL, 'Ordinateur Portable', 'OrdinateurPort'), (NULL, 'Ordinateur Fixe', 'OrdinateurFixe'), (NULL, 'Ecran', 'Ecran'), (NULL, 'Souris', 'Souris'), (NULL, 'Clé USB', 'CleUsb'), (NULL, 'Lecteur USB', 'LecteurUsb'), (NULL, 'Cable', 'Cable'), (NULL, 'Haut-parleur', 'HautParleur'), (NULL, 'GSM', 'Gsm'), (NULL, 'Clavier', 'Clavier'), (NULL, 'Tablette', 'Tablette'), (NULL, 'Disque Dur', 'DisqueDur'), (NULL, 'Carte SD', 'CarteSd'), (NULL, 'Clé WIFI', 'CleWifi'), (NULL, 'Imprimante', 'Imprimante'), (NULL, 'Accessoire GSM', NULL), (NULL, 'Accessoire Ordinateur', NULL), (NULL, 'Autre', NULL);
INSERT INTO `marques` (`id_Marque`, `nom_Marque`) VALUES (NULL, 'Samsung'), (NULL, 'Toshiba'), (NULL, 'Fujitsu'), (NULL, 'Lenovo'), (NULL, 'hp'), (NULL, 'Canon'), (NULL, 'Dell'), (NULL, 'Wiko'), (NULL, 'Acer'), (NULL, 'Autre');
INSERT INTO `produits` (`id_Produit`, `nom_Produit`, `prix_Produit`,`image_Produit`, `descri_Produit`, `stock_Produit`, `dateAjout_Produit`, `id_Categorie`, `id_Marque`) VALUES (NULL, 'Hp random 3457', '255', NULL , 'Un petit ordinateur de qualité douteuse.', '2', '2018-12-04 00:00:00', '1', '5'), (NULL, 'Acer Carot Sulong', '145' , NULL, 'Bam', '1', '2018-12-02 00:00:00', '2', '9'), (NULL, 'Samsung Galaxy T7', '1457', NULL, 'Et hop, un SMIC pour nous', '3', '2018-12-01 00:00:00', '9', '1'), (NULL, 'Marque Random', '12', NULL , 'Une souris electrique très efficace', '5', '2018-12-02 00:00:00', '4', '10'), (NULL, 'GameFreakCompany', '15', NULL, 'Une souris éléctrique jaune qui balance des coup de jus.', '45', '2018-12-01 00:00:00', '4', '10'), (NULL, 'Dell Monitor Randomizer 785421', '43.78', NULL , 'Bah un écran... ', '2', '2018-12-05 00:00:00', '3', '1'), (NULL, 'Clé USB 16Go Tiltator', '12', NULL, 'Une jolie clé USB.', '3', '2018-12-13 00:00:00', '5', '5'), (NULL, 'Lecteur USB pour carte SD', '11', NULL, 'Lecteur de carte SD avec sortie SD. Compatible avec tous les types de SD.', '2', '2018-12-11 00:00:00', '6', '8'), (NULL, 'Cable VGA ', '4.56', NULL, 'Un cable VGA d\'une longueur de 6m. ', '6', '2018-12-12 00:00:00', '7', '4'), (NULL, 'Enceinte bluetooth NormalPaLouch', '63', NULL, 'Une enceinte tout ce qu\'il y a de plus normale... Rien de louche... C\'est vrai, croyez-nous...', '5', '2018-12-12 00:00:00', '8', '1'), (NULL, 'Clavier GAMER', '15', NULL, 'On a mis gamer dans le nom psk les enfants qui jouent à Fortnite adorent. Donnez-nous de l\'argent svp.', '41', '2018-12-04 00:00:00', '10', '9'), (NULL, 'Clavier NORMAL', '10', NULL, 'Normal est en majuscule pour faire la différence avec le clavier gamer, les fans de Fortnite ne viendront pas jusqu\'ici. Bien joué ! Mon respect est inclus avec ce clavier.', '14', '2018-12-02 00:00:00', '10', '2'), (NULL, 'Samsung tablette TroBi1', '145', NULL, 'Une tablette pour jouer à Fortnite. OUAIS !', '14', '2018-12-12 00:00:00', '11', '1'), (NULL, 'Disque Dur Samsung 255 Go', '154', NULL, 'A ce prix, j\'espere qu\'il fait le café mdr... Quoi il le fait vraiment ??? Attends, mais... Pourquoi il se tient debout ? Mais il a un flingue ????? ALED !', '12', '2018-12-04 00:00:00', '12', '1'), (NULL, 'Tite Carte SD pour jouer avec la switch', '24', NULL, 'Ajoutez 50Go de jeux à votre Nintendo Switch. Génial ! (Rendez-moi mes années d\'étude en commerce...)', '14', '2018-12-07 00:00:00', '13', '9'), (NULL, 'Clé Wifi SuperKool', '14', NULL, 'Clé très cool, moi certifier clé fonctionner. Si toi pas croire, toi acheter et essayer. Ah ! Toi peur ? \r\nSi pas peur achete ! Toi moche !', '14', '2018-12-18 00:00:00', '14', '8'), (NULL, 'Imprimante Hp sans fil', '20', NULL, 'Allez, 20€ l\'imprimante c\'est presque donné. Prenez-la svp, c\'est la sixieme fois que je la jete et elle revient... J\'ai peur... Oscour !', '1', '2018-12-09 00:00:00', '15', '10'), (NULL, 'Ecouteurs Apple ', '35', NULL, 'Non mais c\'est vraiment des écouteurs Apple ! C\'est vrai ! Regardez c\'est blanc pareil et y a une pomme derriere ! Non... Quoi ? Une poire ? C\'est quoi ça ? Mais non c\'est une pomme... REVENEZ ATTENDEZ JE VOUS FAIS UN PRIX', '3', '2018-12-01 00:00:00', '16', '10'), (NULL, 'Pochette ordi 15\' ', '47', NULL, 'Une pochette pour ordinateur avec un ecran de max 15\'. Oui, je sais, c\'est dans la marque Acer, mais c\'est psk sinon vous auriez jamais trouvé.', '4', '2018-12-06 00:00:00', '17', '9'), (NULL, 'Truc', '1', NULL, 'En vrai, j\'ai trouvé ça dans mon garage, je sais pas trop ce que c\'est. Si vous êtes interessé, hésitez pas.', '1', '2018-11-20 00:00:00', '18', '10');
INSERT INTO `ordinateurport` (`id_Produit`, `os_OrdinateurPort`, `proc_OrdinateurPort`, `ram_OrdinateurPort`, `memoire_OrdinateurPort`, `tailleEcran_OrdinateurPort`, `nbUsb_OrdinateurPort`, `cable_OrdinateurPort`) VALUES ('1', 'Windows', 'i3', '4', '255Go', '15', '1', 'VGA');
INSERT INTO `ordinateurfixe` (`id_Produit`, `os_OrdinateurFixe`, `proc_OrdinateurFixe`, `ram_OrdinateurFixe`, `memoire_OrdinateurFixe`, `nbUsb_OrdinateurFixe`, `cable_OrdinateurFixe`) VALUES ('2', 'Windows10', 'i3', '8', '500', '4', 'HDMI');
INSERT INTO `ecran` (`id_Produit`, `taille_Ecran`, `cable_Ecran`) VALUES ('6', '17', 'VGA/HDMI');
INSERT INTO `souris` (`id_Produit`, `type_Souris`, `dpi_Souris`, `nbBouton_Souris`) VALUES ('4', 'Sans Fil', '30', '6'), ('5', 'Filaire', NULL, NULL);
INSERT INTO `cleusb` (`id_Produit`, `type_Cle`, `taille_Cle`) VALUES ('7', 'USB 3.0', '16');
INSERT INTO `lecteurusb` (`id_Produit`, `type_Lecteur`, `vitesse_Lecteur`) VALUES ('8', 'Pour carte SD/MicroSD/MacroSD/GigaSD/TerraSD', NULL);
INSERT INTO `cable` (`id_Produit`, `longueur_Cable`, `type_Cable`) VALUES ('9', '1.5', 'VGA/VGA');
INSERT INTO `hautparleur` (`id_Produit`, `cable_HP`, `puissance_HP`, `alimentation_HP`, `resis_HP`, `debit_HP`) VALUES ('10', 'Bluetooth/Jack', NULL, NULL, NULL, NULL);
INSERT INTO `telephone` (`id_Produit`, `type_Tel`, `tailleEcran_Tel`, `os_Tel`, `typeSim_Tel`, `proc_Tel`, `sd_Tel`, `photo_Tel`, `ram_Tel`, `rom_Tel`, `batterie_Tel`, `couleur_Tel`) VALUES ('3', 'Smartphone', '6', 'Android Nougat', 'DualSim', 'dragon', 'Oui', NULL, NULL, '64', NULL, 'Rouge');
INSERT INTO `clavier` (`id_Produit`, `cable_Clavier`, `type_clavier`) VALUES ('11', 'Sans fil', 'Qwerty'), ('12', 'USB 3', 'Azerty');
INSERT INTO `cartesd` (`id_Produit`, `taille_Sd`, `type_Sd`, `adapateur_Sd`) VALUES ('15', '50', 'Micro', 'Macro');
INSERT INTO `clewifi` (`id_Produit`, `typeCle_Wifi`, `vitesse_Wifi`) VALUES ('16', 'USB 3.0', '5Gb/s');
INSERT INTO `imprimante` (`id_Produit`, `wifi_Imprimante`) VALUES ('17', 'Sans fil');
INSERT INTO `disquedur` (`id_Produit`, `type_Disque`, `usb_Disque`, `taille_Disque`) VALUES ('14', 'SSD', 'USB 3.0', '255');
INSERT INTO `tablette` (`id_Produit`, `tailleEcran_Tablette`, `os_Tablette`, `proc_Tablette`, `sd_Tablette`, `photo_Tablette`, `ram_Tablette`, `rom_Tablette`, `batterie_Tablette`, `couleur_Tablette`) VALUES ('13', '11', 'Android Nougatine', NULL, 'Non', NULL, NULL, '124', NULL, 'Bleue');
INSERT INTO `commandes` (`id_Commande`, `paiement_Commande`, `date_Commande`, `prix_Commande`, `remise_Commande`, `id_Users`) VALUES (NULL, 'Carte bancaire', '2018-12-05 00:00:00', '41', '21', '1'), (NULL, 'Carte bancaire', '2018-12-05 00:00:00', '541', '0', '2');
INSERT INTO `commandesdetails` (`id_Produit`, `id_Commande`) VALUES ('4', '1'), ('5', '1'), ('1', '2'), ('2', '2'), ('6', '2');
INSERT INTO `avis` (`id_Produit`, `id_Users`, `commentaire_Avis`, `note_Avis`) VALUES ('5', '1', 'Mais.. Mais... Mais c\'est un pokémon !!', '5'), ('4', '1', 'Bof', '3'), ('1', '2', 'Ok', '2'), ('2', '2', 'Pamal', '4'), ('6', '2', 'Je vois la vie différemment maintenant !', '5');
