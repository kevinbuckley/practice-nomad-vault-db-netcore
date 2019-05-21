## nomad job getting credentials from vault

currently the hackiest, hack that ever hacked.  integrating nomad & vault 

```bash
# run consul server
consul agent -dev

# run vault server
vault server -dev

# setup vault policies and roles
vault policy write nomad-server ./nomad-vault/nomad-server-policy.hcl    
vault write /auth/token/roles/nomad-cluster @nomad-vault/nomad-cluster-role.json 

# create a token for nomad to use and start nomad agent
sudo VAULT_TOKEN=$(vault token create -policy nomad-server -period 72h -orphan | grep -w "token" |  sed 's/.* //') nomad agent -config nomad-vault/nomad-server.hcl -config nomad-vault/nomad-client.hcl
```

```bash
# example of how to build the docker image
cd app
docker build -t app .
docker tag app:latest kbux/kb-dotnet-core-simple:latest
docker push  kbux/kb-dotnet-core-simple:latest
# docker run -d -p 8000:80 --name myapp app
```

```bash
# example of how to run the nomad job
nomad job run app.nomad
```

```bash
open http://10.10.162.188/
```
