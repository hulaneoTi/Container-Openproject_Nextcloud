# Container-Openproject_Nextcloud

### Nextcloud com certificado self signed
- Veja todos os arquivos com atenção, altere o domínio de acordo com a sua necessidade.
- Caso o nextcloud-aio-nextcloud "reclame" do certificado self signed, use os comandos abaixo, porém da forma como está no compose deve funcionar sem problemas:

`sudo docker cp ./ssl/*.crt nextcloud-aio-nextcloud:/usr/local/share/ca-certificates/`

`sudo docker exec --user www-data -it nextcloud-aio-nextcloud php occ security:certificates:import /usr/local/share/ca-certificates/*.crt`

`sudo docker exec -it nextcloud-aio-nextcloud update-ca-certificates`
