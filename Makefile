install:
	apt install nodejs
	npm install -g serverless
	wget -q https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb
	dpkg -i packages-microsoft-prod.deb
	apt install apt-transport-https
	apt update
	apt install dotnet-sdk-2.1.4

build:
	./build.sh

deploy:
	sls deploy

deploy-pipeline:
	aws cloudformation deploy \
		--stack-name sls-dotnet-pipeline \
		--region eu-west-1 \
		--template-file sls-dotnet-pipeline.yml \
		--capabilities CAPABILITY_IAM \
		--parameter-overrides \
			"GithubOauthToken=<YOUR_GITHUB_OAUTH_TOKEN>" \
			"GithubRepoOwner=<YOUR_GITHUB_USER_OR_ORG>" \
			"GithubRepoBranch=master" \
			"DeploymentStage=prod"
