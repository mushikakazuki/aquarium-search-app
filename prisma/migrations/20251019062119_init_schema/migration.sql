/*
  Warnings:

  - You are about to drop the `Fee` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `AccessInfo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `AccessInfo` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `AccessInfo` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `Aquarium` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `officialWebsiteURL` on the `Aquarium` table. All the data in the column will be lost.
  - You are about to drop the column `traveltime` on the `Aquarium` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `Aquarium` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `AquariumOrganism` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `AquariumOrganism` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `AquariumOrganism` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `AquariumTag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `AquariumTag` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `AquariumTag` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `tagId` on the `AquariumTag` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `Comment` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `Comment` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `Comment` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `userId` on the `Comment` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `Favorite` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `Favorite` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `Favorite` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `userId` on the `Favorite` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `Image` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `Image` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `Image` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `OpeningHour` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `aquariumId` on the `OpeningHour` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `OpeningHour` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `Show` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `duration` on the `Show` table. All the data in the column will be lost.
  - You are about to drop the column `venue` on the `Show` table. All the data in the column will be lost.
  - You are about to alter the column `aquariumId` on the `Show` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `id` on the `Show` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `Tag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `slug` on the `Tag` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `Tag` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `User` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - Added the required column `updatedAt` to the `AquariumTag` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Tag` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Fee";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "AquariumInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "officialWebsiteURL" TEXT,
    "timeRequired" INTEGER,
    "isJAZAFlag" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "AquariumInfo_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PriceType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Price" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "priceTypeId" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "note" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Price_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Price_priceTypeId_fkey" FOREIGN KEY ("priceTypeId") REFERENCES "PriceType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_AccessInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "stationName" TEXT NOT NULL,
    "walkMinutes" INTEGER,
    "busRoutes" TEXT,
    "parking" INTEGER,
    "parkingFee" INTEGER,
    "note" TEXT,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "AccessInfo_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AccessInfo" ("aquariumId", "busRoutes", "id", "note", "parking", "parkingFee", "stationName", "updatedAt", "walkMinutes") SELECT "aquariumId", "busRoutes", "id", "note", "parking", "parkingFee", "stationName", "updatedAt", "walkMinutes" FROM "AccessInfo";
DROP TABLE "AccessInfo";
ALTER TABLE "new_AccessInfo" RENAME TO "AccessInfo";
CREATE TABLE "new_Aquarium" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "name_kana" TEXT,
    "prefectures" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "latitude" REAL NOT NULL,
    "longitude" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Aquarium" ("address", "createdAt", "id", "latitude", "longitude", "name", "name_kana", "prefectures", "updatedAt") SELECT "address", "createdAt", "id", "latitude", "longitude", "name", "name_kana", "prefectures", "updatedAt" FROM "Aquarium";
DROP TABLE "Aquarium";
ALTER TABLE "new_Aquarium" RENAME TO "Aquarium";
CREATE TABLE "new_AquariumOrganism" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "AquariumOrganism_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AquariumOrganism" ("aquariumId", "id", "name") SELECT "aquariumId", "id", "name" FROM "AquariumOrganism";
DROP TABLE "AquariumOrganism";
ALTER TABLE "new_AquariumOrganism" RENAME TO "AquariumOrganism";
CREATE TABLE "new_AquariumTag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "AquariumTag_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AquariumTag_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AquariumTag" ("aquariumId", "id", "tagId") SELECT "aquariumId", "id", "tagId" FROM "AquariumTag";
DROP TABLE "AquariumTag";
ALTER TABLE "new_AquariumTag" RENAME TO "AquariumTag";
CREATE TABLE "new_Comment" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "body" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "likes" INTEGER NOT NULL DEFAULT 0,
    "dislikes" INTEGER NOT NULL DEFAULT 0,
    "reports" INTEGER NOT NULL DEFAULT 0,
    "editToken" TEXT NOT NULL,
    "ipHash" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Comment_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Comment" ("aquariumId", "body", "createdAt", "dislikes", "editToken", "id", "ipHash", "likes", "rating", "reports", "status", "updatedAt", "userId") SELECT "aquariumId", "body", "createdAt", "dislikes", "editToken", "id", "ipHash", "likes", "rating", "reports", "status", "updatedAt", "userId" FROM "Comment";
DROP TABLE "Comment";
ALTER TABLE "new_Comment" RENAME TO "Comment";
CREATE TABLE "new_Favorite" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "aquariumId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Favorite_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Favorite_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Favorite" ("aquariumId", "createdAt", "id", "userId") SELECT "aquariumId", "createdAt", "id", "userId" FROM "Favorite";
DROP TABLE "Favorite";
ALTER TABLE "new_Favorite" RENAME TO "Favorite";
CREATE TABLE "new_Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "credit" TEXT,
    "sourceUrl" TEXT,
    "license" TEXT NOT NULL,
    "altText" TEXT,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Image_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Image" ("altText", "aquariumId", "credit", "id", "license", "sortOrder", "sourceUrl", "updatedAt", "url") SELECT "altText", "aquariumId", "credit", "id", "license", "sortOrder", "sourceUrl", "updatedAt", "url" FROM "Image";
DROP TABLE "Image";
ALTER TABLE "new_Image" RENAME TO "Image";
CREATE TABLE "new_OpeningHour" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "dayOfWeek" TEXT NOT NULL,
    "isClosed" BOOLEAN NOT NULL DEFAULT false,
    "openTime" DATETIME NOT NULL,
    "closeTime" DATETIME NOT NULL,
    "note" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "OpeningHour_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_OpeningHour" ("aquariumId", "closeTime", "dayOfWeek", "id", "note", "openTime", "updatedAt") SELECT "aquariumId", "closeTime", "dayOfWeek", "id", "note", "openTime", "updatedAt" FROM "OpeningHour";
DROP TABLE "OpeningHour";
ALTER TABLE "new_OpeningHour" RENAME TO "OpeningHour";
CREATE TABLE "new_Show" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aquariumId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "timeRequired" INTEGER,
    "location" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Show_aquariumId_fkey" FOREIGN KEY ("aquariumId") REFERENCES "Aquarium" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Show" ("aquariumId", "id", "name", "updatedAt") SELECT "aquariumId", "id", "name", "updatedAt" FROM "Show";
DROP TABLE "Show";
ALTER TABLE "new_Show" RENAME TO "Show";
CREATE TABLE "new_Tag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "sortOrder" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Tag" ("id", "name", "sortOrder", "type") SELECT "id", "name", "sortOrder", "type" FROM "Tag";
DROP TABLE "Tag";
ALTER TABLE "new_Tag" RENAME TO "Tag";
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "anonId" TEXT NOT NULL,
    "displayName" TEXT NOT NULL,
    "email" TEXT,
    "trusted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_User" ("anonId", "createdAt", "displayName", "email", "id", "trusted") SELECT "anonId", "createdAt", "displayName", "email", "id", "trusted" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "AquariumInfo_aquariumId_key" ON "AquariumInfo"("aquariumId");
