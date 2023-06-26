#!/bin/sh

echo "🎬 entrypoint.sh: [$(whoami)] [PHP $(php -r 'echo phpversion();')]"

composer dump-autoload --no-interaction --no-dev --optimize

echo "🎬 artisan commands"

# 💡 Group into a custom command e.g. php artisan app:on-deploy
# php artisan migrate --no-interaction --force
php artisan migrate:fresh --seed --no-interaction --force

echo "🎬 MeiliSearch imports"
# php artisan scout:flush "App\Models\ProductoExistencia"
# php artisan scout:import "App\Models\ProductoExistencia"
# php artisan scout:flush "App\Models\User"
# php artisan scout:import "App\Models\User"
# php artisan scout:flush "App\Models\Admin"
# php artisan scout:import "App\Models\Admin"

echo "🎬 start supervisord"

supervisord -c $LARAVEL_PATH/.deploy/config/supervisor.conf
