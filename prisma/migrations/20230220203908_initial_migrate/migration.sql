-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `photo` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,
    `acessType` INTEGER NOT NULL DEFAULT 0,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `students` (
    `studentId` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `classId` INTEGER NOT NULL,

    PRIMARY KEY (`studentId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Class` (
    `classId` INTEGER NOT NULL AUTO_INCREMENT,
    `course` VARCHAR(191) NOT NULL,
    `grade` INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY (`classId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `students` ADD CONSTRAINT `students_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `students` ADD CONSTRAINT `students_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `Class`(`classId`) ON DELETE RESTRICT ON UPDATE CASCADE;
