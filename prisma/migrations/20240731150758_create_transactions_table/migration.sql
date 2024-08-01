/*
  Warnings:

  - You are about to drop the `checkout` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `checkout` DROP FOREIGN KEY `checkout_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `checkout` DROP FOREIGN KEY `checkout_user_id_fkey`;

-- DropTable
DROP TABLE `checkout`;

-- CreateTable
CREATE TABLE `checkouts` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `product_id` VARCHAR(191) NOT NULL,
    `transaction_id` VARCHAR(191) NULL,
    `qty` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `price_per_item` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `total_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `delivery_fee` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `asurance_fee` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `application_fee` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `grand_total_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `deliveryType` ENUM('HOME_DELIVERY', 'STORE_PICKUP') NOT NULL DEFAULT 'HOME_DELIVERY',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `checkouts` ADD CONSTRAINT `checkouts_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `checkouts` ADD CONSTRAINT `checkouts_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `checkouts` ADD CONSTRAINT `checkouts_transaction_id_fkey` FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
