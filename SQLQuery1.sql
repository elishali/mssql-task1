CREATE DATABASE TurboApp;

use TurboApp;

create table Markas(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table Models(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
MarkaId int NOT NULL,
Constraint FK_Models_MarkaId foreign key(MarkaId) References Markas(Id),
)

create table Categories(
Id int identity(1,1) primary key,
[Name] Varchar(200) NOT NULL,
)

create table Colors(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table FuelTypes(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table Gears(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table Transmissions(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table Markets(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table Equipments(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
)

create table Advertisements(
Id int identity(1,1) primary key,
Mileage decimal(18,1) NOT NULL,
MileageUnit tinyint NOT NULL,
Price int NOT NULL,
Currency int NOT NULL,
IsCrashed bit NOT NULL,
IsPainted bit NOT NULL,
ForSpareParts bit NOT NULL,
SeatsCount tinyint,
HasLoan bit NOT NULL,
HasBarter bit NOT NULL,
Vin varchar(200) NOT NULL,
[Description] varchar(200) NOT NULL,
[Year] int NOT NULL,
EngineVolume int NOT NULL,
EnginePower int NOT NULL,
ModelId int NOT NULL,
CategoryId int NOT NULL,
ColorId int NOT NULL,
FuelTypeId int NOT NULL,
GearId int NOT NULL,
TransmissionId int NOT NULL,

Constraint FK_Advertisement_ModelId foreign key (ModelId) references Models(Id),
Constraint FK_Advertisement_FuelTypeId foreign key (FuelTypeId) references FuelTypes(Id),
Constraint FK_Advertisement_ColorId foreign key (ColorId) references Colors(Id),
Constraint FK_Advertisement_GearId foreign key (GearId) references Gears(Id),
Constraint FK_Advertisement_TransmissionId foreign key (TransmissionId) references Transmissions(Id),
Constraint FK_Advertisement_CategoryId foreign key (CategoryId) references Categories(Id),

Constraint CK_Advertisement_Price check (Price >0),
Constraint CK_Advertisement_Year check ([Year] >1970 and [Year] <= year(getdate())),
)

create table AdvertisementEquipments(
AdvertisementId int NOT NULL,
EquipmentId int NOT NULL,
Constraint PK_AdvertisementEquipments primary key (AdvertisementId,EquipmentId),
Constraint FK_AdvertisementEquipments foreign key(AdvertisementId) references Advertisements(Id),
Constraint FK_AdvertisementEquipment foreign key(EquipmentId) references Equipments(Id),
)

create table Images(
Id int identity(1,1) primary key,
[Name] varchar(200) NOT NULL,
ViewPoint tinyint,
AdvertisementId int NOT NULL,
Constraint FK_Images_AdvertisementId foreign key (AdvertisementId) references Advertisements(Id),
)