# local-llm
Set of tools which allows to make a combination of ollama and bedrock

## How to setup LLM local
- login with AWS `aws-vault exec profile`
- run `./setup.sh`
- create local user in web-ui: admin@example.com admin:admin
- open admin setting `http://localhost:3000/admin/settings` 
- open connections
- add `http://host.docker.internal:8080/api/v1` and API_KEY from docker-compose.yml  to `Manage OpenAI API Connections` section
- click save
- open models 
- check that you have `anthropic.claude-3-5-sonnet-20240620-v1:0` model

## BedRock local proxy
### URL
- http://localhost:8080/api/v1/
- URL for webui http://host.docker.internal:8080/api/v1
### IAM for bedrock proxy
```
bedrock:ListFoundationModels
bedrock:ListInferenceProfiles
---
bedrock:InvokeModel
bedrock:InvokeModelWithResponseStream
arn:aws:bedrock:*::foundation-model/*
arn:aws:bedrock:*:*:inference-profile/*
```
bedrock proxy supports Parameter Store and storing access key there 

# open-web-ui first start 
- wait around 20-30 seconds for the service to start
- create admin account admin@admin.com admin 
- `anthropic.claude-3-5-sonnet-20240620-v1:0` 

