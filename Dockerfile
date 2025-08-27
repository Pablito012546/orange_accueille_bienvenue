# Utiliser l'image PHP officielle avec Apache
FROM php:8.2-apache

# Copier les fichiers du projet dans le dossier web de Apache
COPY . /var/www/html/

# Donner les bons droits à Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Activer mod_rewrite (utile pour beaucoup de projets PHP)
RUN a2enmod rewrite

# Exposer le port 80
EXPOSE 80

# Lancer Apache au démarrage
CMD ["apache2-foreground"]
