-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/Ekf32Rtw4UGXO82G-z33cQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Aviso" (
    "AvisoID" int  NOT NULL ,
    "UsuarioID" int  NOT NULL ,
    "titulo" varchar(200)  NOT NULL ,
    "imagen" image  NOT NULL ,
    "texto" varchar(200)  NOT NULL ,
    "estado" enum('Pendiente','Activo','Inactivo')  NOT NULL ,
    "fecha" date  NOT NULL ,
    CONSTRAINT "pk_Aviso" PRIMARY KEY (
        "AvisoID"
    )
)

GO

-- Table documentation comment 2
CREATE TABLE "Usuarios" (
    "UsuarioID" int  NOT NULL ,
    -- Field documentation comment 3 FK >- Aviso.AvisoID
    "Name" varchar(200)  NOT NULL ,
    "mail" varchar(200)  NOT NULL ,
    "permiso" ENUM('usuario','admin')  NOT NULL ,
    CONSTRAINT "pk_Usuarios" PRIMARY KEY (
        "UsuarioID"
    )
)

GO

CREATE TABLE "Comentario" (
    "ComentarioID" int  NOT NULL ,
    "AvisoID" int  NOT NULL ,
    "Texto" string  NOT NULL ,
    "Fecha" date  NOT NULL ,
    CONSTRAINT "pk_Comentario" PRIMARY KEY (
        "ComentarioID"
    )
)

GO

CREATE TABLE "Categoria" (
    "CategoriaID" int  NOT NULL ,
    "Codigo" varchar(20)  NOT NULL ,
    "Nombre" string  NOT NULL ,
    CONSTRAINT "pk_Categoria" PRIMARY KEY (
        "CategoriaID"
    )
)

GO

CREATE TABLE "Categoria_Aviso" (
    "Categoria_AvisoID" int  NOT NULL ,
    "CategoriaID" int  NOT NULL ,
    "AvisoID" int  NOT NULL ,
    CONSTRAINT "pk_Categoria_Aviso" PRIMARY KEY (
        "Categoria_AvisoID"
    )
)

GO

ALTER TABLE "Aviso" ADD CONSTRAINT "fk_Aviso_UsuarioID" FOREIGN KEY("UsuarioID")
REFERENCES "Usuarios" ("UsuarioID")
GO

ALTER TABLE "Comentario" ADD CONSTRAINT "fk_Comentario_AvisoID" FOREIGN KEY("AvisoID")
REFERENCES "Aviso" ("AvisoID")
GO

ALTER TABLE "Categoria" ADD CONSTRAINT "fk_Categoria_CategoriaID" FOREIGN KEY("CategoriaID")
REFERENCES "Categoria_Aviso" ("CategoriaID")
GO

ALTER TABLE "Categoria_Aviso" ADD CONSTRAINT "fk_Categoria_Aviso_AvisoID" FOREIGN KEY("AvisoID")
REFERENCES "Aviso" ("AvisoID")
GO

