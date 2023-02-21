-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "photo" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "acessType" INTEGER NOT NULL DEFAULT 0,
    "studentId" INTEGER,
    CONSTRAINT "users_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "students" ("studentId") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "students" (
    "studentId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "classId" INTEGER NOT NULL,
    CONSTRAINT "students_classId_fkey" FOREIGN KEY ("classId") REFERENCES "classes" ("classId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "classes" (
    "classId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "course" TEXT NOT NULL,
    "grade" INTEGER NOT NULL DEFAULT 1
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");
