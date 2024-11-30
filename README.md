# Container-Openproject_Nextcloud

### Nextcloud com certificado self signed
- Veja o todos os arquivos com atenção, altere o domínio de acordo com a sua necessidade.
- Caso o nextcloud-aio-nextcloud não reclame do certificado self signed, use os comandos abaixo, porém da forma como está no compose deve funcionar sem problemas.

`sudo docker cp ./ssl/coelho.tools.crt nextcloud-aio-nextcloud:/usr/local/share/ca-certificates/coelho.tools.crt

sudo docker exec -it nextcloud-aio-nextcloud update-ca-certificates`
