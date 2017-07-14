# DenyHosts

Runs a lightweight up to date, [DenyHosts](https://github.com/denyhosts/denyhosts) 3.0 instance on the log file you choose (usually `/var/log/secure`) and writes the IP addresses that have been blocked  to `/etc/hosts.deny`.

By default it'll upload IPs you block to the DenyHosts sync server to share with other DenyHosts users, you can turn this off in the `denyhosts.conf` config file.

 You can also download other blocked IPs by enabling `SYNC_DOWNLOAD` in the `denyhosts.conf` config file.

## Usage

### Debian / Ubuntu

```
docker run -d \
	--name DenyHosts \
	--restart=always \
	-v /var/log/auth.log:/var/log/auth.log:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	adriel/denyhosts
```

### CentOS

```
docker run -d \
	--name DenyHosts \
	--restart=always \
	-v /var/log/secure:/var/log/secure:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	adriel/denyhosts
```



### Using your own config file

Overwrite `denyhosts.conf` with your own settings:

```
docker run -d \
	--name DenyHosts \
	--restart=always \
	-v /var/log/secure:/var/log/secure:ro \
	-v /etc/hosts.deny:/etc/hosts.deny \
	-v /your/location/denyhosts.conf:/etc/denyhosts.conf \
	adriel/denyhosts
```



## docker-compose

There is a example [docker-compose.yml](https://github.com/adriel/denyhosts-docker/blob/master/docker-compose.yml) file included in the repository to help you get started if you use docker-compose.