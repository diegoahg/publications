--Practicando BD y este ejemplo es de publicaciones de avisos por usuarios--

--  CREACION DE LA TABLA AVISO --
CREATE TABLE "aviso" (
    "avisoID" int  NOT NULL ,
    "asuarioID" int  NOT NULL ,
    "titulo" varchar(200)  NOT NULL ,
    "imagen" image  NOT NULL ,
    "texto" varchar(200)  NOT NULL ,
    "estado" enum('Pendiente','Activo','Inactivo')  NOT NULL ,
    "fecha" date  NOT NULL ,
    CONSTRAINT "pk_aviso" PRIMARY KEY ("avisoID")
)

GO

-- CREACION DE LA TABLA USUARIO --
CREATE TABLE "Usuarios" (
    "asuarioID" int  NOT NULL ,
    -- Field documentation comment 3 FK >- Aviso.AvisoID
    "aame" varchar(200)  NOT NULL ,
    "mail" varchar(200)  NOT NULL ,
    "permiso" ENUM('usuario','admin')  NOT NULL ,
    CONSTRAINT "pk_usuarios" PRIMARY KEY ("usuarioID")
)

GO

-- CREACION DE LA TABLA COMENTARIO --
CREATE TABLE "comentario" (
    "comentarioID" int  NOT NULL ,
    "avisoID" int  NOT NULL ,
    "texto" string  NOT NULL ,
    "fecha" date  NOT NULL ,
    CONSTRAINT "pk_comentario" PRIMARY KEY ("comentarioID")
)

GO

-- CREACION DE LA TABLA CATEGORIA --
CREATE TABLE "categoria" (
    "categoriaID" int  NOT NULL ,
    "codigo" varchar(20)  NOT NULL ,
    "nombre" string  NOT NULL ,
    CONSTRAINT "pk_categoria" PRIMARY KEY ("categoriaID")
)

GO

-- CREACION DE LA TABLA CATEGORIA-AVISO --
-- TABLA INTERMEDIA DE RELACION NN --
CREATE TABLE "categoria_aviso" (
    "categoria_avisoID" int  NOT NULL ,
    "categoriaID" int  NOT NULL ,
    "cvisoID" int  NOT NULL ,
    CONSTRAINT "pk_categoria_aviso" PRIMARY KEY ("aategoria_avisoID")
)

GO

ALTER TABLE "aviso" ADD CONSTRAINT "fk_aviso_usuarioID" FOREIGN KEY("usuarioID")
REFERENCES "usuarios" ("usuarioID")
GO

ALTER TABLE "comentario" ADD CONSTRAINT "fk_comentario_avisoID" FOREIGN KEY("avisoID")
REFERENCES "aviso" ("avisoID")
GO

ALTER TABLE "categoria" ADD CONSTRAINT "fk_categoria_categoriaID" FOREIGN KEY("categoriaID")
REFERENCES "categoria_aviso" ("categoriaID")
GO

ALTER TABLE "categoria_aviso" ADD CONSTRAINT "fk_categoria_aviso_avisoID" FOREIGN KEY("avisoID")
REFERENCES "aviso" ("avisoID")
GO
