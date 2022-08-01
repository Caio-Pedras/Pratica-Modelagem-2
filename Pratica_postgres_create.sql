CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" integer NOT NULL UNIQUE,
	"categoryId" integer NOT NULL,
	"size" varchar(3) NOT NULL,
	"mainImageUrl" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL DEFAULT 'NOW ()',
	"userId" integer NOT NULL,
	"adressId" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productdId" integer NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchasesProducts" (
	"id" serial NOT NULL,
	"purchaseId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"totalPrice" integer NOT NULL,
	CONSTRAINT "purchasesProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adress" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT,
	"postalCode" varchar(8) NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	CONSTRAINT "adress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("adressId") REFERENCES "adress"("id");

ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("productdId") REFERENCES "products"("id");

ALTER TABLE "purchasesProducts" ADD CONSTRAINT "purchasesProducts_fk0" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");
ALTER TABLE "purchasesProducts" ADD CONSTRAINT "purchasesProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "adress" ADD CONSTRAINT "adress_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");









