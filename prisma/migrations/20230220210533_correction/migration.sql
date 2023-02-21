-- DropForeignKey
ALTER TABLE `users` DROP FOREIGN KEY `users_studentId_fkey`;

-- AlterTable
ALTER TABLE `users` MODIFY `studentId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `students`(`studentId`) ON DELETE SET NULL ON UPDATE CASCADE;
