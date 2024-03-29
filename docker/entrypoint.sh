#!/bin/bash

# First time configuration composer install
if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

# Create .env file
if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
else
    echo "env file exists."
fi

# Addional Laravel cli execution
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan migrate
php artisan db:seed --class=AdminUserSeeder

# Start web serve for Laravel project
php artisan serve --port=$PORT --host=0.0.0.0 --env=.env
exec docker-php-entrypoint "$@"
