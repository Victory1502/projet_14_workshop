#!/bin/bash
DATE=$(date +%Y%m%d_%H%M)

echo "[INFO] Sauvegarde GLPI / MariaDB / Cassandra / Elasticsearch"

# Sauvegarde DB GLPI
docker exec glpi_db mysqldump -uglpi -pglpi_pass glpi > backup_glpi_$DATE.sql

# Snapshot Elasticsearch
docker exec elasticsearch curl -X PUT "localhost:9200/_snapshot/backup_repo/snapshot_$DATE?wait_for_completion=true"

# Snapshot Cassandra (ex: nodetool)
docker exec cassandra nodetool snapshot -t backup_$DATE

# Copie des volumes (simple)
docker run --rm --volumes-from glpi_db -v $(pwd):/backup alpine tar czf /backup/mariadb_$DATE.tar.gz /var/lib/mysql

echo "[OK] Sauvegarde terminée : $DATE"
