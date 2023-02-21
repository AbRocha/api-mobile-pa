/*
  Warnings:

  - You are about to drop the column `userId` on the `students` table. All the data in the column will be lost.
  - You are about to drop the `Class` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `studentId` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `students` DROP FOREIGN KEY `students_classId_fkey`;

-- DropForeignKey
ALTER TABLE `students` DROP FOREIGN KEY `students_userId_fkey`;

-- AlterTable
ALTER TABLE `students` DROP COLUMN `userId`;

-- AlterTable
ALTER TABLE `users` ADD COLUMN `studentId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `Class`;

-- CreateTable
CREATE TABLE `classes` (
    `classId` INTEGER NOT NULL AUTO_INCREMENT,
    `course` VARCHAR(191) NOT NULL,
    `grade` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`classId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `students`(`studentId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `students` ADD CONSTRAINT `students_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `classes`(`classId`) ON DELETE RESTRICT ON UPDATE CASCADE;
