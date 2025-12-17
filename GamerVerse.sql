
-- CAPÍTULO 1: CREACIÓN DE BASE DE DATOS
CREATE DATABASE GamerVerse;
GO
USE GamerVerse;
GO

-- TABLA DE JUGADORES
CREATE TABLE Jugadores (
    JugadorID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(50),
    FechaRegistro DATE DEFAULT GETDATE(),
    Nivel INT DEFAULT 1,
    Experiencia INT DEFAULT 0
);

-- INSERTS (originales + añadidos coherentes)
INSERT INTO Jugadores (Nombre, Pais, Nivel, Experiencia) VALUES
('Raven', 'México', 12, 3500),
('Kai', 'Chile', 5, 800),
('Lira', 'Argentina', 20, 7600);

-- Añadimos jugadores adicionales hasta 50 en total (minimalista coherente)
INSERT INTO Jugadores (Nombre, Pais, Nivel, Experiencia) VALUES
('Aldren','México',25,15400),
('Lyra','España',42,38900),
('Kornex','Perú',18,7200),
('Velora','Colombia',57,81200),
('Dravok','Chile',33,21150),
('Mirela','Argentina',12,3500),
('Tarkun','México',60,91000),
('Seraph','Uruguay',44,43000),
('Xylo','Bolivia',20,7800),
('Nimrel','Paraguay',29,15600),
('Rethar','México',31,17800),
('Orya','Chile',27,14500),
('Fyorin','Perú',15,5200),
('Zariel','Argentina',55,77000),
('Kaedra','México',48,51000),
('Melvon','Chile',36,26000),
('Ilyra','Argentina',14,4100),
('Raxos','México',59,89500),
('Nareth','Perú',40,36000),
('Jorvik','Chile',23,12000),
('Salvor','Argentina',19,8000),
('Tymera','México',26,13000),
('Quentar','Chile',34,24000),
('Lyneth','Argentina',32,20000),
('Vorin','México',50,68000),
('Eshra','Chile',44,43800),
('Galden','Argentina',17,6900),
('Keryn','México',13,3900),
('Faelor','Chile',52,70000),
('Darex','Argentina',60,95000),
('Miron','México',22,11000),
('Syrel','Chile',25,15000),
('Orvak','Argentina',28,16000),
('Ithar','México',19,8200),
('Weyra','Chile',35,25000),
('Qorim','Argentina',39,33000),
('Teral','México',21,10500),
('Velkyn','Chile',45,47000),
('Zerya','Argentina',11,3100),
('Haldor','México',56,79000),
('Xerath','Chile',43,39500),
('Jynra','Argentina',18,7400),
('Mordel','México',26,14000),
('Elryn','Chile',37,27500),
('Tyrol','Argentina',41,35000),
('Fynra','México',20,7600),
('Korvex','Chile',53,71000),
('Selian','Argentina',30,17500),
('Yrva','México',24,12500),
('Gorth','Chile',16,5800);

-- TABLA DE JUEGOS
CREATE TABLE Juegos (
    JuegoID INT IDENTITY PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Desarrolladora VARCHAR(100),
    Lanzamiento DATE,
    Genero VARCHAR(50)
);

-- INSERTS (originales + añadidos)
INSERT INTO Juegos (Titulo, Desarrolladora, Lanzamiento, Genero) VALUES
('Starfall Odyssey', 'NebulaWorks', '2022-05-14', 'RPG'),
('Steel Arena', 'IronForge', '2020-11-03', 'Shooter'),
('Mystic Realms', 'LunarSoft', '2023-02-20', 'MMO');

-- Juegos adicionales (minimally coherent, to reach a useful set)
INSERT INTO Juegos (Titulo, Desarrolladora, Lanzamiento, Genero) VALUES
('Neon Drift','Hyperbyte','2019-09-10','Racing'),
('Phantom Siege','Abyssal Studios','2021-03-22','Strategy'),
('Echoes of Gaia','GreenPeak','2018-07-18','Adventure'),
('Skyward Bound','AetherGames','2024-01-05','Platformer'),
('Crimson Tides','MarinerDev','2020-12-12','Action'),
('Quantum Runners','PulseLabs','2022-08-30','Roguelike'),
('Voidwalkers','DarkField','2021-10-11','Sci-Fi'),
('Temple of Whispers','EchoForge','2017-04-02','Puzzle'),
('Ironclad Legends','SteelForge','2016-06-14','MOBA'),
('Solaris Outpost','Sunflare','2023-09-21','Simulation'),
('Arcane Symphony','LunarSoft','2020-02-14','RPG'),
('Shadow Corridor','NightShift','2019-11-01','Horror'),
('Neptune''s Call','AquaCore','2018-03-09','Adventure'),
('Frostfall','GlacierWorks','2021-12-01','MMO'),
('Thunderstrike 2077','VoltGames','2022-04-19','Shooter'),
('Verdant Isles','GreenPeak','2019-05-06','MMO'),
('Wasteland Riders','BurnoutStudio','2016-10-27','Racing'),
('Celestial Forge','NebulaWorks','2023-06-17','Strategy'),
('Broken Compass','Driftwood','2015-09-09','Adventure'),
('Mecha Arena','TitanWorks','2024-02-20','Fighting'),
('Lanterns of Dawn','AuroraGames','2020-08-08','RPG'),
('Spectral Knights','PhantomLab','2018-11-11','Action'),
('Galactic Traders','Starline','2017-01-30','Simulation'),
('Midnight Harvest','HarvestMoon','2019-03-15','Casual'),
('Binary Souls','CodeCraft','2021-07-07','Puzzle'),
('Riftbreakers','VoidTech','2022-10-10','Shooter'),
('Oracle of Ages','ChronosDev','2016-02-22','RPG'),
('Vortex Run','SpinWorks','2018-09-05','Racing'),
('Echo Harbor','MarinerDev','2020-06-06','Adventure'),
('Titanfall Legends','IronForge','2015-12-12','Shooter'),
('Lanescape','AetherGames','2024-04-02','Platformer'),
('Netherbound','DarkField','2019-01-20','Horror'),
('Pocket Alchemists','AlchemyInc','2017-07-21','Casual'),
('Starship Courier','NebulaWorks','2021-05-05','Simulation'),
('Mythos Rising','LunarSoft','2023-11-11','RPG'),
('Drift Horizon','Hyperbyte','2018-08-08','Racing'),
('Silent Echo','NightShift','2022-01-13','Horror'),
('Forge of Titans','SteelForge','2014-04-04','Strategy'),
('Garden of Codes','CodeCraft','2019-02-02','Puzzle'),
('Iron Seas','MarinerDev','2020-10-10','Action'),
('Neon Noir','PulseLabs','2021-09-09','Adventure'),
('ChronoGap','ChronosDev','2016-06-06','RPG'),
('Starbound Frontier','Starline','2022-11-11','MMO'),
('Silent Skies','AetherGames','2017-08-18','Platformer'),
('Shadow Bazaar','PhantomLab','2018-12-12','Strategy'),
('Aurora Drift','SpinWorks','2023-03-03','Racing'),
('Lunar Gardens','GreenPeak','2015-05-05','Casual');

-- TABLA PLATAFORMAS
CREATE TABLE Plataformas (
    PlataformaID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Fabricante VARCHAR(50)
);

-- INSERTS (originales + añadidos)
INSERT INTO Plataformas (Nombre, Fabricante) VALUES
('PC', 'Varios'),
('PlayBox X', 'PlayBox Inc.'),
('NexaSwitch', 'NexaCorp');

-- Plataformas adicionales (coherente set)
INSERT INTO Plataformas (Nombre, Fabricante) VALUES
('ArcStation','ArcCorp'),
('MobileOS','OpenMobile'),
('CloudStream','StreamSoft'),
('RetroBox','VintageTech'),
('Handheld Pro','PocketPlay'),
('UltraVR','Visionary'),
('AlphaConsole','AlphaWorks'),
('BetaPad','BetaTech'),
('GammaGear','GammaLabs'),
('OmegaStation','OmegaCorp'),
('CrystalDeck','CrystalStudios'),
('WaveConsole','WaveWorks'),
('SkyPad','Skyline Inc.'),
('NeoBox','NeoCorp'),
('PocketOne','PocketPlay'),
('StreamBox','StreamSoft'),
('MiniStation','MiniWare'),
('ProPC','Varios'),
('HomeConsole','PlayBox Inc.'),
('SwitchLiteX','NexaCorp'),
('MotionPad','MotionWorks'),
('ArcadeHub','ArcadeCo'),
('CloudConsole','CloudSoft'),
('MicroConsole','MicroTech'),
('EdgePlay','EdgeSystems'),
('FusionBox','FusionCorp'),
('LunaStation','LunarSoft'),
('VoltPad','VoltGames');

-- TABLA INTERMEDIA: JUEGO PLATAFORMA
CREATE TABLE JuegoPlataforma (
    JuegoID INT FOREIGN KEY REFERENCES Juegos(JuegoID),
    PlataformaID INT FOREIGN KEY REFERENCES Plataformas(PlataformaID),
    PRIMARY KEY (JuegoID, PlataformaID)
);

-- INSERTS existentes
INSERT INTO JuegoPlataforma VALUES
(1,1),(1,2),(2,1),(2,2),(2,3),(3,1),(3,3);

-- Asociaciones adicionales (coherentes)
INSERT INTO JuegoPlataforma VALUES
(4,1),(4,9),(5,2),(5,4),(6,1),(6,5),(7,8),(7,1),(8,1),(8,2),
(9,1),(9,10),(10,1),(10,3),(11,1),(11,6),(12,2),(12,11),(13,1),(13,14),
(14,1),(14,2),(15,2),(15,9),(16,3),(16,1),(17,1),(17,3),(18,1),(18,2),
(19,3),(19,1),(20,1),(20,2),(21,1),(21,4),(22,2),(22,7),(23,1),(23,2);

-- TABLA PARTIDAS
CREATE TABLE Partidas (
    PartidaID INT IDENTITY PRIMARY KEY,
    JugadorID INT FOREIGN KEY REFERENCES Jugadores(JugadorID),
    JuegoID INT FOREIGN KEY REFERENCES Juegos(JuegoID),
    DuracionMin INT,
    Puntuacion INT,
    FechaPartida DATETIME DEFAULT GETDATE()
);

-- INSERTS (originales + añadidos)
INSERT INTO Partidas (JugadorID, JuegoID, DuracionMin, Puntuacion) VALUES
(1,1,45,1200),
(1,2,30,900),
(2,1,60,1500),
(3,3,90,2200);

-- Partidas adicionales coherentes
INSERT INTO Partidas (JugadorID, JuegoID, DuracionMin, Puntuacion) VALUES
(4,5,25,850),(5,7,120,3200),(6,8,15,400),(7,10,200,5400),(8,11,35,1100),
(9,4,55,1300),(10,6,40,1250),(11,12,33,980),(12,13,47,1400),(13,14,22,760),
(14,15,60,1900),(15,16,78,2100),(16,17,12,300),(17,18,150,4200),(18,19,20,700),
(19,20,95,2600),(20,21,30,1000),(21,22,44,1300),(22,23,50,1500),(23,24,70,1800),
(24,25,15,450),(25,26,55,1600),(26,27,28,800),(27,28,34,950),(28,29,66,2000),
(29,30,88,2400),(30,31,24,720),(31,32,48,1450),(32,33,39,1120),(33,34,57,1700),
(34,35,18,600),(35,36,85,2300),(36,37,27,880),(37,38,31,920),(38,39,99,3000),
(39,40,42,1350),(40,41,53,1550),(41,42,29,770),(42,43,64,2050),(43,44,36,980),
(44,45,58,1750),(45,46,21,680),(46,47,81,2250),(47,48,26,820),(48,49,33,960),
(49,50,49,1500),(50,1,60,1800);

-- TABLA LOGROS
CREATE TABLE Logros (
    LogroID INT IDENTITY PRIMARY KEY,
    JuegoID INT FOREIGN KEY REFERENCES Juegos(JuegoID),
    Nombre VARCHAR(100),
    Dificultad VARCHAR(20)
);

-- INSERTS (originales + añadidos)
INSERT INTO Logros (JuegoID, Nombre, Dificultad) VALUES
(1,'Cazador Estelar','Media'),
(1,'Dominador Galáctico','Alta'),
(2,'Maestro del Acero','Alta'),
(3,'Sabio Arcano','Media');

-- Logros adicionales (coherentes)
INSERT INTO Logros (JuegoID, Nombre, Dificultad) VALUES
(4,'Velocidad Terminal','Alta'),(5,'Estratega','Media'),(6,'Curioso','Baja'),
(7,'Aventurero','Baja'),(8,'Campeón','Alta'),(9,'Resuelto','Media'),(10,'Sobreviviente','Alta'),
(11,'Constructor','Media'),(12,'Vencedor','Alta'),(13,'Explorador','Baja'),(14,'Soberano','Alta'),
(15,'Técnico','Media'),(16,'Contrabandista','Baja'),(17,'Guardian','Alta'),(18,'Nómada','Baja'),
(19,'Dominador','Alta'),(20,'Piloto','Media'),(21,'Maestro','Alta'),(22,'Campeón de la Arena','Media'),
(23,'Sabio del Código','Alta'),(24,'Cosechador','Baja'),(25,'Mercader','Media'),(26,'Viajero','Baja'),
(27,'Centinela','Alta'),(28,'Rápido','Baja'),(29,'Veterano','Media'),(30,'Gladiador','Alta'),
(31,'Trotamundos','Baja'),(32,'Resolutivo','Media'),(33,'Centella','Alta'),(34,'Sabio del Tiempo','Alta'),
(35,'Constructor Mayor','Media'),(36,'Campeón del Void','Alta'),(37,'Estratega Naval','Media'),(38,'Cazador Silente','Alta'),
(39,'Místico','Media'),(40,'Forjador','Alta'),(41,'Custodio','Media'),(42,'Señor de la Carrera','Alta'),
(43,'Ocultista','Media'),(44,'Artífice','Alta'),(45,'Sabueso','Baja'),(46,'Alquimista','Media'),
(47,'Aplastador','Alta'),(48,'Caminante','Baja'),(49,'Coleccionista','Media'),(50,'Heraldo','Alta');

-- TABLA LOGROS DESBLOQUEADOS
CREATE TABLE LogrosJugador (
    JugadorID INT FOREIGN KEY REFERENCES Jugadores(JugadorID),
    LogroID INT FOREIGN KEY REFERENCES Logros(LogroID),
    FechaDesbloqueo DATE DEFAULT GETDATE(),
    PRIMARY KEY (JugadorID, LogroID)
);

-- INSERTS (originales + añadidos)
INSERT INTO LogrosJugador VALUES
(1,1),(1,3),(2,1),(3,4);

-- LogrosJugador adicionales (coherentes)
INSERT INTO LogrosJugador VALUES
(4,6),(4,14),(5,9),(5,25),(6,10),(7,30),(7,47),(8,12),(8,41),(9,13),
(9,19,(10,15)),(10,20),(11,21),(11,31),(12,22),(12,32),(13,23),(13,33),(14,24),(14,34),
(15,26),(15,35),(16,27),(16,37),(17,28),(17,38),(18,29),(18,39),(19,40),(19,42),
(20,43),(20,44),(21,45),(21,46),(22,48),(22,49),(23,50),(23,1),(24,2),(24,3),
(25,4),(25,5),(26,6),(26,7),(27,8),(27,9),(28,10),(28,11),(29,12),(29,13),
(30,14),(30,15),(31,16),(31,17),(32,18),(32,19),(33,20),(33,21),(34,22),(34,23),
(35,24),(35,25),(36,26),(36,27),(37,28),(37,29),(38,30),(38,31),(39,32),(39,33),
(40,34),(40,35),(41,36),(41,37),(42,38),(42,39),(43,40),(43,41),(44,42),(44,43),
(45,44),(45,45),(46,46),(46,47),(47,48),(47,49),(48,50),(48,1),(49,2),(49,3),
(50,4),(50,5);

-- STORED PROCEDURE EJEMPLO
CREATE PROCEDURE IncrementarExperiencia
    @JugadorID INT,
    @Cantidad INT
AS
BEGIN
    UPDATE Jugadores
    SET Experiencia = Experiencia + @Cantidad
    WHERE JugadorID = @JugadorID;
END;
GO

-- TRIGGER EJEMPLO: subir nivel al superar 1000 exp
CREATE TRIGGER AutoNivelUP
ON Jugadores
AFTER UPDATE
AS
BEGIN
    UPDATE Jugadores
    SET Nivel = Nivel + 1
    WHERE Experiencia >= 1000 AND Nivel < (Experiencia / 1000);
END;
GO

-- FUNCIÓN EJEMPLO: total de logros por jugador
CREATE FUNCTION TotalLogrosJugador(@JugadorID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) FROM LogrosJugador WHERE JugadorID = @JugadorID;
    RETURN @Total;
END;
GO

-- TRANSACCIÓN EJEMPLO
BEGIN TRAN
    UPDATE Jugadores SET Experiencia = Experiencia + 500 WHERE JugadorID = 1;
    INSERT INTO Partidas (JugadorID, JuegoID, DuracionMin, Puntuacion) VALUES (1,3,70,1800);
COMMIT;
GO

-- CAPÍTULO 2: EXPANSIÓN AVANZADA
-- Nuevos conceptos para seguir entrenando habilidades SQL avanzadas

-- TABLA DE AUDITORÍA DE PARTIDAS
CREATE TABLE AuditoriaPartidas (
    AuditID INT IDENTITY PRIMARY KEY,
    PartidaID INT,
    JugadorID INT,
    JuegoID INT,
    Fecha DATETIME DEFAULT GETDATE(),
    Evento VARCHAR(100)
);
GO

-- TRIGGER: registrar cada partida insertada
CREATE TRIGGER RegistrarPartida
ON Partidas
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditoriaPartidas (PartidaID, JugadorID, JuegoID, Evento)
    SELECT PartidaID, JugadorID, JuegoID, 'Nueva partida registrada'
    FROM inserted;
END;
GO

-- FUNCIÓN AVANZADA: promedio de puntuación por jugador
CREATE FUNCTION PromedioPuntuacionJugador(@JugadorID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Prom FLOAT;
    SELECT @Prom = AVG(Puntuacion) FROM Partidas WHERE JugadorID = @JugadorID;
    RETURN @Prom;
END;
GO

-- VISTA: ranking global de jugadores por experiencia
CREATE VIEW RankingExperiencia AS
SELECT JugadorID, Nombre, Nivel, Experiencia
FROM Jugadores
ORDER BY Experiencia DESC;
GO

-- CAPÍTULO 3: MECÁNICAS COMPLEJAS Y NIVEL ARQUITECTO

-- TABLA: CLANES
CREATE TABLE Clanes (
    ClanID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Fundacion DATE DEFAULT GETDATE()
);

-- POBLADO MINIMALISTA Y COHERENTE (CLANES)
INSERT INTO Clanes (Nombre) VALUES
('GuardianesDelPixel'),
('SombraArcana'),
('FauceDeAcero'),
('HermandadNebular'),
('EcoEterno');

-- TABLA: MIEMBROS DE CLAN
CREATE TABLE ClanMiembros (
    ClanID INT FOREIGN KEY REFERENCES Clanes(ClanID),
    JugadorID INT FOREIGN KEY REFERENCES Jugadores(JugadorID),
    Rol VARCHAR(50) DEFAULT 'Miembro',
    PRIMARY KEY (ClanID, JugadorID)
);
GO

-- POBLADO MINIMALISTA Y COHERENTE (CLANMIEMBROS)
INSERT INTO ClanMiembros (ClanID, JugadorID, Rol) VALUES
(1,1,'Lider'),
(1,5,'Miembro'),
(1,12,'Miembro'),
(2,3,'Lider'),
(2,7,'Miembro'),
(2,15,'Miembro'),
(3,2,'Lider'),
(3,8,'Miembro'),
(4,10,'Lider'),
(4,16,'Miembro'),
(5,4,'Lider'),
(5,11,'Miembro');

-- TABLA: COMERCIO ENTRE JUGADORES
CREATE TABLE Comercio (
    TradeID INT IDENTITY PRIMARY KEY,
    JugadorOrigen INT FOREIGN KEY REFERENCES Jugadores(JugadorID),
    JugadorDestino INT FOREIGN KEY REFERENCES Jugadores(JugadorID),
    Item VARCHAR(100),
    Cantidad INT,
    Fecha DATETIME DEFAULT GETDATE()
);
GO

-- POBLADO MINIMALISTA Y COHERENTE (COMERCIO)
-- Estos son intercambios válidos (no legendarios)
INSERT INTO Comercio (JugadorOrigen, JugadorDestino, Item, Cantidad) VALUES
(1,2,'Espada Oxidada',1),
(3,5,'Arco Ligero',2),
(7,10,'Báculo de Roble',1),
(8,4,'Botas Rápidas',1),
(12,15,'Poción Pequeña',3);

-- TABLA: ITEMS GLOBALES
CREATE TABLE Items (
    ItemID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Rareza VARCHAR(50)
);
GO

-- POBLADO MINIMALISTA Y COHERENTE (ITEMS)
INSERT INTO Items (Nombre, Rareza) VALUES
('Espada Oxidada','Común'),
('Arco Ligero','Poco Común'),
('Báculo de Roble','Común'),
('Poción Pequeña','Común'),
('Escudo Robusto','Raro'),
('Casco de Cristal','Raro'),
('Guantes Sombríos','Épico'),
('Piedra Lunar','Raro'),
('Anillo Carmesí','Épico'),
('Hoja Eterna','Legendario'),
('Orbe Violeta','Poco Común'),
('Pergamino Antiguo','Raro'),
('Túnica del Eco','Épico'),
('Fragmento de Sol','Legendario'),
('Amuleto Gris','Común');

-- TABLA INTERMEDIA: INVENTARIOS
CREATE TABLE Inventarios (
    JugadorID INT FOREIGN KEY REFERENCES Jugadores(JugadorID),
    ItemID INT FOREIGN KEY REFERENCES Items(ItemID),
    Cantidad INT DEFAULT 1,
    PRIMARY KEY (JugadorID, ItemID)
);
GO

-- POBLADO MINIMALISTA Y COHERENTE (INVENTARIOS)
-- Incluye items legendarios en inventario, pero no en comercio (salvo intento controlado)
INSERT INTO Inventarios (JugadorID, ItemID, Cantidad) VALUES
(1,1,1),(1,4,5),(2,2,1),(2,3,1),(3,4,3),(3,5,2),
(4,6,1),(4,8,1),(5,7,1),(6,9,4),(7,10,1),(8,11,2),(9,12,1),(10,13,1);

-- CTE RECURSIVA: niveles ascendentes por experiencia
WITH Niveles AS (
    SELECT JugadorID, Nombre, Nivel, Experiencia, 1 AS Paso
    FROM Jugadores
    UNION ALL
    SELECT JugadorID, Nombre, Nivel + 1, Experiencia, Paso + 1
    FROM Niveles
    WHERE Nivel < (Experiencia / 500)
)
SELECT * FROM Niveles;
GO

-- PROCEDIMIENTO: transferir ítems entre jugadores con verificación
CREATE PROCEDURE TransferirItem
    @Origen INT,
    @Destino INT,
    @ItemID INT,
    @Cantidad INT
AS
BEGIN
    BEGIN TRAN
        IF NOT EXISTS (SELECT 1 FROM Inventarios WHERE JugadorID = @Origen AND ItemID = @ItemID AND Cantidad >= @Cantidad)
        BEGIN
            ROLLBACK;
            RETURN;
        END

        UPDATE Inventarios
        SET Cantidad = Cantidad - @Cantidad
        WHERE JugadorID = @Origen AND ItemID = @ItemID;

        MERGE Inventarios AS T
        USING (SELECT @Destino AS JugadorID, @ItemID AS ItemID, @Cantidad AS Cantidad) AS S
        ON T.JugadorID = S.JugadorID AND T.ItemID = S.ItemID
        WHEN MATCHED THEN UPDATE SET Cantidad = T.Cantidad + S.Cantidad
        WHEN NOT MATCHED THEN INSERT VALUES (S.JugadorID, S.ItemID, S.Cantidad);

    COMMIT;
END;
GO

-- TRIGGER: impedir intercambios de rareza ‘Legendaria’ sin autorización
CREATE TRIGGER BlockLegendaryTrades
ON Comercio
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i JOIN Items it ON i.Item = it.Nombre WHERE it.Rareza = 'Legendario')
    BEGIN
        -- Intento de comercio legendario detectado: se bloquea (esto es intencional y para pruebas)
        PRINT 'Intercambio bloqueado: rareza legendaria restringida';
        RETURN;
    END

    INSERT INTO Comercio SELECT * FROM inserted;
END;
GO

-- CAPÍTULO 4: SUBCONSULTAS, JOINS Y PROCEDIMIENTOS AVANZADOS

-- PROCEDIMIENTO COMPLEJO: reporte de actividad del jugador
CREATE PROCEDURE ReporteActividadJugador
    @JugadorID INT
AS
BEGIN
    SELECT j.Nombre,
           (SELECT COUNT(*) FROM Partidas p WHERE p.JugadorID = j.JugadorID) AS TotalPartidas,
           (SELECT COUNT(*) FROM LogrosJugador lj WHERE lj.JugadorID = j.JugadorID) AS TotalLogros,
           (SELECT AVG(Puntuacion) FROM Partidas p WHERE p.JugadorID = j.JugadorID) AS PromedioPuntuacion
    FROM Jugadores j
    WHERE j.JugadorID = @JugadorID;
END;
GO

-- PROCEDIMIENTO: registrar partida con validaciones
CREATE PROCEDURE RegistrarPartidaSegura
    @JugadorID INT,
    @JuegoID INT,
    @Duracion INT,
    @Puntuacion INT
AS
BEGIN
    IF @Duracion <= 0 OR @Puntuacion < 0 RETURN;

    INSERT INTO Partidas (JugadorID, JuegoID, DuracionMin, Puntuacion)
    VALUES (@JugadorID, @JuegoID, @Duracion, @Puntuacion);
END;
GO

-- SUBCONSULTA: juegos favoritos por mayor puntuación histórica
CREATE VIEW JuegosFavoritos AS
SELECT j.JugadorID, ju.Titulo,
       (SELECT MAX(Puntuacion) FROM Partidas p WHERE p.JugadorID = j.JugadorID AND p.JuegoID = ju.JuegoID) AS MaxPuntuacion
FROM Jugadores j
JOIN Juegos ju ON EXISTS (SELECT 1 FROM Partidas p WHERE p.JugadorID = j.JugadorID AND p.JuegoID = ju.JuegoID);
GO

-- JOIN MULTINIVEL: resumen de comercio
CREATE VIEW ResumenComercio AS
SELECT c.TradeID, o.Nombre AS Origen, d.Nombre AS Destino, c.Item, c.Cantidad, c.Fecha
FROM Comercio c
JOIN Jugadores o ON c.JugadorOrigen = o.JugadorID
JOIN Jugadores d ON c.JugadorDestino = d.JugadorID;
GO

/* ===============================================================
   🎮 ESTRUCTURA GAMER – GUÍA DE EJERCICIOS 🎮
   ===============================================================
   Cada capítulo contiene ejercicios desde principiante hasta avanzado
   listos para practicar SQL Server.
   =============================================================== */

-- ===============================================================
-- ====================== CAPÍTULO 1 – BÁSICO ===================
-- Descripción: Ejercicios introductorios para SELECT, WHERE, subconsultas simples y GROUP BY básico.
-- ===============================================================

-- ================== EJERCICIOS TIPO ENTREVISTA =================
-- 1. Obtener el jugador con mayor número de partidas.
-- 2. Mostrar el promedio de puntuación por cada juego.
-- 3. Listar los juegos que están disponibles en más de 2 plataformas.
-- 4. Encontrar a los jugadores que han desbloqueado más de 2 logros.
-- 5. Mostrar el top 3 de jugadores con mayor experiencia.
-- 6. Usar una subconsulta para obtener los juegos donde la puntuación promedio supere 1500.
-- 7. Obtener todos los jugadores que nunca han desbloqueado un logro.
-- 8. Contar logros por dificultad usando GROUP BY.
-- 9. Actualizar la experiencia de cada jugador en base a la cantidad de partidas jugadas.
-- 10. Listar todos los jugadores que pertenecen a un clan específico.

-- ===============================================================
-- ====================== CAPÍTULO 2 – INTERMEDIO =================
-- Descripción: Ejercicios para practicar VISTAS, PROCEDIMIENTOS ALMACENADOS,
-- TRANSACCIONES, TRIGGERS y FUNCIONES usando la base de datos GamerVerse.
-- ===============================================================

-- ================== EJERCICIOS DE VISTAS =================
-- 1. Crear una vista que muestre todos los jugadores y la cantidad total de partidas jugadas.
-- 2. Crear una vista que muestre los juegos con la cantidad de logros disponibles por cada juego.
-- 3. Crear una vista que combine jugadores, juegos jugados y el promedio de puntuación de cada jugador.

-- ============ EJERCICIOS DE PROCEDIMIENTOS ALMACENADOS ============
-- 4. Crear un procedimiento que aumente la experiencia de un jugador en base a su partida reciente.
-- 5. Crear un procedimiento que registre una nueva partida, incluyendo duración, puntuación y jugador.
-- 6. Crear un procedimiento que elimine a un jugador y todos sus registros de partidas e inventario.
-- 7. Crear un procedimiento que otorgue un logro específico a todos los jugadores de un nivel determinado.
-- 8. Crear un procedimiento que actualice la rareza de todos los ítems de un jugador según reglas de rareza.
-- 9. Crear un procedimiento que reinicie estadísticas de un juego (puntajes, partidas, logros) manteniendo auditoría.
-- 10. Crear un procedimiento que asigne un clan a un grupo de jugadores automáticamente según sus niveles.

-- ================== EJERCICIOS DE TRANSACCIONES =================
-- 11. Crear una transacción que registre una partida, aumente experiencia y genere un log en la tabla de auditoría.
-- 12. Crear una transacción que transfiera ítems entre dos jugadores asegurando que la cantidad exista.
-- 13. Crear una transacción que reinicie niveles y experiencia de todos los jugadores (simulando un "server wipe").

-- ================== EJERCICIOS DE TRIGGERS =================
-- 14. Crear un trigger que impida insertar partidas con duración negativa en la tabla Partidas.
-- 15. Crear un trigger que registre automáticamente en auditoría cada nueva partida de Jugadores.
-- 16. Crear un trigger que actualice el nivel de un jugador cuando su experiencia supere un umbral.

-- ================== EJERCICIOS DE FUNCIONES =================
-- 17. Crear una función que devuelva el total de logros desbloqueados por un jugador.
-- 18. Crear una función que calcule el promedio de puntuación de un jugador en todos sus juegos.
-- 19. Crear una función que indique si un jugador es "Activo" o "Inactivo" según su última partida.
-- 20. Crear una función que devuelva la puntuación máxima alcanzada por un jugador en un juego específico.

-- ================== EJERCICIOS VARIOS / COMBINADOS =================
-- 21. Crear un procedimiento que aumente experiencia y devuelva el nuevo nivel usando la función de cálculo.
-- 22. Crear una vista que combine jugadores, logros y promedio de puntuación.
-- 23. Crear una función que indique el total de partidas de un jugador en un rango de fechas.
-- 24. Crear una transacción que registre un comercio entre jugadores y actualice inventarios de manera segura.


-- ===============================================================
-- ====================== CAPÍTULO 3 – CTE =======================
-- Descripción: Ejercicios de CTE (Common Table Expressions) para 
-- nivel principiante y básico, enfocados en consultas de la base 
-- de datos GamerVerse.
-- ===============================================================

-- CTE – EJERCICIOS
-- 1. Crear un CTE que liste todos los jugadores con su nivel y experiencia.
-- 2. Crear un CTE que muestre los juegos junto con la cantidad de partidas registradas.
-- 3. Crear un CTE que liste los jugadores con más de 2 logros desbloqueados.
-- 4. Crear un CTE que muestre los jugadores y el total de partidas que han jugado, ordenados de mayor a menor.
-- 5. Crear un CTE que combine jugadores y sus partidas mostrando el promedio de puntuación por jugador.


-- ===============================================================
-- ====================== CAPÍTULO 4 – SUBCONSULTAS =================
-- Descripción: Ejercicios para practicar subconsultas simples, anidadas,
-- correlacionadas, con EXISTS y con funciones de agregado, usando la base
-- de datos GamerVerse.
-- ===============================================================

-- ------------------- SUBCONSULTAS SIMPLES -------------------
-- 1. Obtener los nombres de los jugadores que tienen más de 3 partidas.
-- 2. Listar los juegos cuyo lanzamiento fue después de 2020.
-- 3. Mostrar los jugadores cuyo nivel es mayor al promedio de todos los jugadores.

-- ------------------- SUBCONSULTAS ANIDADAS -------------------
-- 4. Obtener los juegos con puntuación promedio mayor al promedio global de puntuaciones.
-- 5. Listar los jugadores que han desbloqueado logros de juegos del género 'RPG'.
-- 6. Encontrar los clanes que tienen miembros con más de 50,000 de experiencia acumulada.

-- ------------------- SUBCONSULTAS CORRELACIONADAS -------------------
-- 7. Mostrar los jugadores cuyo puntaje máximo en alguna partida supera su promedio.
-- 8. Obtener los juegos que tienen al menos un jugador con más de 3 logros desbloqueados.
-- 9. Listar los ítems que poseen más cantidad que el promedio de ese ítem en todos los jugadores.

-- ------------------- SUBCONSULTAS CON EXISTS -------------------
-- 10. Listar los jugadores que han jugado algún juego en todas las plataformas disponibles.
-- 11. Mostrar los juegos que tienen al menos un logro desbloqueado por algún jugador.
-- 12. Obtener los jugadores que han comerciado al menos una vez con otro jugador.

-- ------------------- SUBCONSULTAS CON AGREGADOS -------------------
-- 13. Obtener los juegos cuya cantidad de logros supera el promedio de logros por juego.
-- 14. Listar los jugadores que tienen inventarios con más ítems que el promedio de inventario general.
-- 15. Mostrar los clanes cuya experiencia total de miembros es mayor que la media de todos los clanes.

-- ------------------- SUBCONSULTAS MIXTAS -------------------
-- 16. Mostrar los jugadores que nunca han desbloqueado un logro y cuyo nivel es mayor al promedio.
-- 17. Listar los juegos que no han sido jugados por jugadores con menos de 5 partidas.
-- 18. Obtener los jugadores que poseen ítems raros y que también han participado en comercio.
-- 19. Mostrar los ítems que no han sido movidos en ninguna transacción de comercio.
-- 20. Listar los jugadores que han jugado todos los juegos de un género específico (ej. 'Shooter').


-- ===============================================================
-- ====================== CAPÍTULO 5 – JOINS ======================
-- Descripción: Ejercicios para practicar INNER JOIN, LEFT JOIN, RIGHT JOIN y combinaciones,
-- usando la base de datos GamerVerse.
-- ===============================================================

-- JOINS – EJERCICIOS
-- 1. Listar todos los jugadores junto con los juegos que han jugado (INNER JOIN).
-- 2. Mostrar todos los juegos y los jugadores que han participado, incluyendo juegos sin jugadores (LEFT JOIN).
-- 3. Listar jugadores y sus clanes, mostrando también los jugadores que no pertenecen a ningún clan (LEFT JOIN).
-- 4. Obtener todos los logros y los jugadores que los han desbloqueado, incluyendo logros que nadie tiene (LEFT JOIN).
-- 5. Mostrar todas las partidas y los ítems usados, incluyendo partidas donde no se usó ningún ítem (LEFT JOIN).
-- 6. Listar jugadores con la información de su país y clanes, mostrando solo coincidencias completas (INNER JOIN múltiple).
-- 7. Obtener los juegos y la cantidad de partidas registradas en cada juego (JOIN + GROUP BY).
-- 8. Mostrar jugadores con sus logros y el nombre del juego correspondiente (INNER JOIN múltiple).
-- 9. Listar todas las combinaciones de jugadores y juegos, incluyendo donde no hay partidas (FULL OUTER JOIN).
-- 10. Mostrar los ítems de los inventarios de jugadores junto con sus clanes, incluyendo jugadores sin clan ni ítems (LEFT JOIN múltiple).

-- ===============================================================
-- ====================== CAPÍTULO 6 – GROUP BY & HAVING =========
-- Descripción: Ejercicios para practicar agregaciones, GROUP BY y filtros con HAVING
-- en la base de datos GamerVerse.
-- ===============================================================

-- ------------------- AGREGACIONES BÁSICAS -------------------
-- 1. Contar cuántos jugadores hay por cada nivel.
-- 2. Obtener el promedio de experiencia por cada juego.
-- 3. Determinar la suma total de duración de partidas por jugador.
-- 4. Contar la cantidad de logros por dificultad.
-- 5. Obtener la cantidad de partidas jugadas por cada jugador.

-- ------------------- USO DE HAVING -------------------
-- 6. Listar los juegos con más de 10 partidas registradas.
-- 7. Mostrar jugadores con más de 1000 puntos de experiencia.
-- 8. Obtener clanes con más de 5 miembros.
-- 9. Mostrar ítems que poseen más de 3 jugadores.
-- 10. Obtener juegos cuyo promedio de puntuación supere 1500.

-- ------------------- AGRUPACIONES Y FILTROS AVANZADOS -------------------
-- 11. Contar la cantidad de jugadores por país con más de 5 jugadores.
-- 12. Obtener la experiencia promedio por cada clan que tenga más de 3 miembros.
-- 13. Mostrar la cantidad total de partidas por plataforma, filtrando las que superen 50 partidas.
-- 14. Calcular la suma de puntos de todos los logros por dificultad, mostrando solo los mayores a 500.
-- 15. Listar los 3 juegos con mayor número de logros desbloqueados usando GROUP BY y HAVING.

-- ------------------- COMBINANDO GROUP BY CON OTRAS TABLAS -------------------
-- 16. Contar la cantidad de ítems por rareza que poseen los jugadores de un clan específico.
-- 17. Obtener la suma de experiencia de jugadores que hayan jugado un juego específico.
-- 18. Mostrar la cantidad de partidas por jugador y filtrar los que superen 10 partidas.
-- 19. Contar el número de logros desbloqueados por jugador y mostrar solo los que tienen más de 5 logros.
-- 20. Obtener el promedio de puntuación por juego y filtrar los que tengan más de 3 jugadores participando.

-- ===============================================================
-- ====================== CAPÍTULO 7 – LÓGICA ===================
-- Descripción: Ejercicios de lógica y razonamiento aplicados a la base de datos GamerVerse,
-- dificultad principiante-intermedia.
-- ===============================================================

-- ------------------- EJERCICIOS DE LÓGICA -------------------
-- 1. Encontrar jugadores que hayan jugado más partidas que su propio promedio de clan.
-- 2. Listar juegos donde la suma de las puntuaciones de todos los jugadores sea mayor a 5000.
-- 3. Identificar clanes con más del doble de miembros que el clan más pequeño.
-- 4. Mostrar jugadores cuya experiencia es mayor que la del jugador con menor experiencia en su mismo nivel.
-- 5. Listar ítems que sean más raros que el promedio de rareza de todos los ítems.
-- 6. Encontrar jugadores que hayan desbloqueado al menos un logro en cada juego que hayan jugado.
-- 7. Mostrar juegos que tengan más logros desbloqueados que la mitad de los juegos de la base de datos.
-- 8. Identificar jugadores que hayan participado en todas las partidas de un juego específico.
-- 9. Listar clanes cuyo total de experiencia de todos sus miembros sea mayor que la suma de experiencia de otro clan específico.
-- 10. Mostrar jugadores cuyo número de ítems poseídos sea mayor que la media de su clan.


-- ===============================================================
-- ====================== CAPÍTULO 8 – FUNCIONES DE AGREGADO =====
-- Descripción: Ejercicios para practicar funciones de agregado en la base de datos GamerVerse.
-- Se incluyen SUM, AVG, MAX, MIN, COUNT y combinaciones con GROUP BY.
-- ===============================================================

-- ------------------- SUMA (SUM) -------------------
-- 1. Obtener la suma total de experiencia de todos los jugadores.
-- 2. Calcular la suma de la duración de todas las partidas de un jugador específico.
-- 3. Obtener la suma total de puntos de todos los logros desbloqueados.

-- ------------------- PROMEDIO (AVG) -------------------
-- 4. Calcular el promedio de puntuación por cada juego.
-- 5. Obtener la experiencia promedio de los jugadores por nivel.
-- 6. Determinar el promedio de duración de partidas por cada jugador.

-- ------------------- MÁXIMO (MAX) -------------------
-- 7. Encontrar el jugador con mayor experiencia.
-- 8. Determinar la partida con mayor duración en la base de datos.
-- 9. Obtener el logro con mayor cantidad de puntos otorgados.

-- ------------------- MÍNIMO (MIN) -------------------
-- 10. Encontrar el jugador con menor experiencia.
-- 11. Determinar la partida más corta jugada por cualquier jugador.
-- 12. Obtener el logro con menor cantidad de puntos otorgados.

-- ------------------- CONTEO (COUNT) -------------------
-- 13. Contar el total de jugadores en la base de datos.
-- 14. Contar cuántos logros ha desbloqueado cada jugador.
-- 15. Contar la cantidad de partidas jugadas por cada juego.

-- ------------------- COMBINACIÓN DE FUNCIONES -------------------
-- 16. Calcular la suma total de experiencia y el promedio de puntuación por juego.
-- 17. Obtener el máximo y mínimo de duración de partidas por cada jugador.
-- 18. Contar la cantidad de logros por dificultad y calcular el promedio de puntos de esos logros.
-- 19. Mostrar la suma total de puntos de logros y la cantidad de jugadores que los poseen.
-- 20. Agrupar partidas por juego y calcular la puntuación promedio, máxima y mínima.

-- ===============================================================
-- ====================== CAPÍTULO 9 – EJERCICIOS COMBINADOS =====
-- Descripción: Ejercicios que combinan varios conceptos aprendidos
-- en capítulos anteriores: joins, subconsultas, group by, having,
-- CTE, procedimientos almacenados y funciones de agregado.
-- ===============================================================

-- ------------------- COMBINANDO JOINS Y SUBCONSULTAS -------------------
-- 1. Listar jugadores junto con su clan y la cantidad total de logros que han desbloqueado.
-- 2. Mostrar los juegos junto con el promedio de puntuación de jugadores que tienen más de 500 de experiencia.
-- 3. Obtener los jugadores que no han participado en ninguna partida de un juego específico.

-- ------------------- JOINS + GROUP BY + HAVING -------------------
-- 4. Listar los clanes con más de 3 miembros y su promedio de experiencia total.
-- 5. Mostrar los 5 juegos con mayor número de partidas registradas y su puntuación promedio.
-- 6. Contar la cantidad de ítems por rareza que poseen los jugadores activos (jugado en últimos 30 días).

-- ------------------- CTE + AGREGACIONES -------------------
-- 7. Usando un CTE, mostrar la progresión de niveles de cada jugador y calcular el promedio de experiencia por nivel.
-- 8. Crear un CTE que liste todos los clanes con más de 2 juegos jugados por sus miembros y mostrar el total de partidas por clan.

-- ------------------- PROCEDIMIENTOS ALMACENADOS + LOGICA -------------------
-- 9. Crear un procedimiento que registre una nueva partida, actualice la experiencia del jugador y valide que la puntuación no sea negativa.
-- 10. Crear un procedimiento que transfiera ítems entre jugadores y devuelva un mensaje indicando éxito o error si algún jugador no existe.
-- 11. Crear un procedimiento que genere un reporte de logros desbloqueados por cada jugador de un clan específico, ordenado por dificultad.

-- ------------------- EJERCICIOS DE FILTROS Y SUBCONSULTAS -------------------
-- 12. Listar jugadores que han participado en todos los juegos de un determinado género usando NOT EXISTS.
-- 13. Mostrar los ítems que no posee ningún jugador activo en los últimos 30 días.
-- 14. Obtener los 3 jugadores con mayor experiencia que nunca hayan desbloqueado un logro raro.

-- ------------------- EJERCICIOS MIXTOS -------------------
-- 15. Crear un informe que combine jugadores, partidas y logros, mostrando solo los jugadores con más de 1000 puntos de experiencia.
-- 16. Mostrar la cantidad total de partidas por juego y por plataforma, filtrando los juegos con promedio de puntuación mayor a 1500.
-- 17. Usando subconsulta y join, listar los jugadores que hayan jugado más de 5 partidas en juegos que tengan más de 2 plataformas.
-- 18. Obtener el top 3 de clanes con mayor experiencia promedio de sus miembros y la cantidad de partidas jugadas.
-- 19. Listar los 5 jugadores con más ítems de rareza épica y su clan (si tienen).
-- 20. Crear un procedimiento que genere un ranking de jugadores por logros desbloqueados y actualice una tabla de estadísticas.

-- ===============================================================
-- ====================== CAPÍTULO 10 – PROGRAMACIÓN SQL =========
-- Descripción: Ejercicios para practicar procedimientos almacenados, triggers,
-- transacciones, cursores y SQL dinámico en la base de datos GamerVerse.
-- ===============================================================

-- ------------------- PROCEDIMIENTOS ALMACENADOS -------------------
-- 1. Crear un procedimiento que actualice la experiencia de un jugador
--    después de terminar una partida.
-- 2. Crear un procedimiento que agregue un nuevo logro a un jugador
--    verificando que no exista previamente.
-- 3. Crear un procedimiento que devuelva la lista de jugadores de un clan específico
--    ordenados por experiencia descendente.

-- ------------------- TRANSACCIONES Y MANEJO DE ERRORES -------------------
-- 4. Crear una transacción que registre una nueva partida, aumente la experiencia
--    y registre auditoría. Usar TRY...CATCH para manejar errores.
-- 5. Crear una transacción que transfiera un ítem de un jugador a otro
--    y revierta la operación si el ítem no existe o el jugador destino no es válido.

-- ------------------- TRIGGERS -------------------
-- 6. Crear un trigger AFTER INSERT en la tabla de partidas
--    que registre automáticamente un log en la tabla de auditoría.
-- 7. Crear un trigger AFTER UPDATE en la tabla de jugadores
--    que registre los cambios de nivel en la tabla de auditoría.

-- ------------------- CURSORES -------------------
-- 8. Crear un cursor que recorra todos los jugadores de un clan
--    y aumente su experiencia en un 10%.

-- ------------------- SQL DINÁMICO -------------------
-- 9. Crear un procedimiento que reciba el nombre de una tabla
--    y devuelva la cantidad de registros usando SQL dinámico.
-- 10. Crear un procedimiento que construya dinámicamente una consulta
--     para listar partidas filtradas por cualquier columna y valor dado.

-- ===============================================================
-- ================ GUÍA ULTRA COMENTADA GAMERVERSE ============
-- Descripción: Ejemplos funcionales explicados línea por línea
-- para aprender SQL Server usando la base de datos GamerVerse.
-- Incluye vistas, procedimientos, transacciones, triggers, funciones
-- y programación básica en SQL Server.
-- ===============================================================

-- ===============================================================
-- 1. VISTA
-- CUÁNDO USAR: 
-- Para consultas frecuentes que combinan varias tablas. 
-- Útil cuando quieres simplificar SELECT complejos y reutilizables.
-- EJEMPLO: ver el promedio de puntuación por jugador y juego.
-- ===============================================================
CREATE VIEW vw_Jugadores_PromedioPuntuacion AS
-- CREATE VIEW: define una vista, que es como una "tabla virtual" basada en SELECT
SELECT 
    j.IdJugador, -- Selecciona el ID del jugador
    j.Nombre,    -- Selecciona el nombre del jugador
    COUNT(p.IdPartida) AS TotalPartidas, -- Cuenta cuántas partidas tiene cada jugador
    AVG(p.Puntuacion) AS PromedioPuntuacion -- Calcula el promedio de puntuación
FROM Jugadores j -- Tabla principal: Jugadores
LEFT JOIN Partidas p ON j.IdJugador = p.IdJugador
-- LEFT JOIN: Une con Partidas, incluyendo jugadores que aún no tienen partidas
GROUP BY j.IdJugador, j.Nombre;
-- GROUP BY: Necesario para usar COUNT y AVG por jugador

-- ===============================================================
-- 2. PROCEDIMIENTO ALMACENADO
-- CUÁNDO USAR: 
-- Para encapsular lógica repetitiva o actualizaciones frecuentes.
-- EJEMPLO: aumentar experiencia de un jugador tras una partida.
-- ===============================================================
CREATE PROCEDURE sp_ActualizarExperiencia
    @IdJugador INT, -- Parámetro: ID del jugador
    @Experiencia INT -- Parámetro: cantidad de experiencia a sumar
AS
BEGIN
    -- BEGIN...END: delimita el bloque de instrucciones del procedimiento
    UPDATE Jugadores
    SET Experiencia = Experiencia + @Experiencia
    WHERE IdJugador = @IdJugador;
    -- Actualiza la experiencia del jugador especificado
END;

-- ===============================================================
-- 3. TRANSACCIÓN
-- CUÁNDO USAR:
-- Cuando varias operaciones deben ejecutarse juntas o revertirse si falla alguna.
-- EJEMPLO: insertar partida, actualizar experiencia y registrar auditoría.
-- ===============================================================
BEGIN TRAN Transaccion_Partida
-- Inicia la transacción y le da un nombre
BEGIN TRY
    -- BEGIN TRY: Bloque que intenta ejecutar las instrucciones
    INSERT INTO Partidas(IdJugador, IdJuego, Puntuacion, Duracion)
    VALUES (1, 2, 1500, 50);
    -- Inserta una nueva partida del jugador 1 en el juego 2

    UPDATE Jugadores
    SET Experiencia = Experiencia + 150
    WHERE IdJugador = 1;
    -- Actualiza la experiencia del jugador 1

    INSERT INTO AuditoriaPartidas(IdJugador, Evento, Fecha)
    VALUES (1, 'Partida registrada y experiencia actualizada', GETDATE());
    -- Registra el evento en la tabla de auditoría con la fecha actual

    COMMIT TRAN;
    -- Confirma los cambios si todo salió bien
END TRY
BEGIN CATCH
    -- BEGIN CATCH: Bloque que se ejecuta si ocurre algún error
    ROLLBACK TRAN;
    -- Revierta todo lo que se hizo dentro de la transacción
    PRINT 'Error en la transacción';
END CATCH;

-- ===============================================================
-- 4. TRIGGER
-- CUÁNDO USAR:
-- Para automatizar acciones al insertarse, actualizarse o eliminarse datos.
-- EJEMPLO: registrar automáticamente en auditoría cada nueva partida.
-- ===============================================================
CREATE TRIGGER trg_AuditoriaPartida
ON Partidas
AFTER INSERT
AS
BEGIN
    -- AFTER INSERT: se ejecuta después de insertar una fila
    INSERT INTO AuditoriaPartidas(IdJugador, Evento, Fecha)
    SELECT IdJugador, 'Partida registrada', GETDATE()
    FROM inserted;
    -- 'inserted' es una tabla especial que contiene las filas recién insertadas
END;

-- ===============================================================
-- 5. FUNCIÓN
-- CUÁNDO USAR:
-- Para cálculos reutilizables que pueden usarse en SELECT, WHERE o vistas.
-- EJEMPLO: determinar si un jugador está activo según actividad reciente.
-- ===============================================================
CREATE FUNCTION fn_JugadorActivo(@IdJugador INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Resultado VARCHAR(20);
    -- DECLARE: declara una variable local para guardar el resultado

    IF EXISTS (
        SELECT 1
        FROM Partidas
        WHERE IdJugador = @IdJugador
        AND Fecha > DATEADD(DAY, -60, GETDATE())
        -- Verifica si el jugador jugó alguna partida en los últimos 60 días
    )
        SET @Resultado = 'Jugador Activo';
    ELSE
        SET @Resultado = 'Jugador Inactivo';
    -- Asigna texto según haya jugado o no

    RETURN @Resultado;
    -- RETURN: devuelve el valor de la función
END;

-- ===============================================================
-- 6. PROGRAMACIÓN SQL
-- CUÁNDO USAR:
-- Para automatizar tareas dentro de SQL Server usando variables, condicionales y loops.
-- EJEMPLO: recorrer jugadores y dar bonificación a los que no jugaron en más de 7 días.
-- ===============================================================
DECLARE @IdJugador INT;
DECLARE @DiasSinJugar INT;
-- DECLARE: declara variables para uso dentro del código

DECLARE JugadoresCursor CURSOR FOR
SELECT IdJugador, DATEDIFF(DAY, MAX(Fecha), GETDATE()) AS DiasSinJugar
FROM Partidas
GROUP BY IdJugador;
-- Cursor: permite recorrer fila por fila el resultado de la consulta

OPEN JugadoresCursor;
FETCH NEXT FROM JugadoresCursor INTO @IdJugador, @DiasSinJugar;
-- FETCH NEXT: obtiene la primera fila del cursor

WHILE @@FETCH_STATUS = 0
-- Mientras haya filas en el cursor
BEGIN
    IF @DiasSinJugar > 7
    -- Condicional: si el jugador no jugó en más de 7 días
    BEGIN
        UPDATE Jugadores
        SET Experiencia = Experiencia + 100
        WHERE IdJugador = @IdJugador;
        -- Actualiza experiencia dando bonificación
    END
    FETCH NEXT FROM JugadoresCursor INTO @IdJugador, @DiasSinJugar;
    -- Mueve el cursor a la siguiente fila
END

CLOSE JugadoresCursor;
-- Cierra el cursor
DEALLOCATE JugadoresCursor;
-- Libera recursos del cursor
