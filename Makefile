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
