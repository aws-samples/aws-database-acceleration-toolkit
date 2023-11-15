#!/bin/bash
sudo yum -y update
sudo yum install -y git
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

sudo amazon-linux-extras install -y docker
sudo systemctl enable docker
sudo systemctl start docker

sudo mkdir jenkins
cd jenkins


sudo cat <<EOF >disable-script-security.groovy
import javaposse.jobdsl.plugin.GlobalJobDslSecurityConfiguration
import jenkins.model.GlobalConfiguration

// disable Job DSL script approval
GlobalConfiguration.all().get(GlobalJobDslSecurityConfiguration.class).useScriptSecurity=false
GlobalConfiguration.all().get(GlobalJobDslSecurityConfiguration.class).save()
EOF

sudo cat <<EOF >seedJob.xml
<?xml version='1.0' encoding='UTF-8'?>
<project>
  <actions/>
  <description></description>
  <displayName>Seed Job</displayName>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class="hudson.plugins.git.GitSCM" plugin="git@3.3.2">
    <configVersion>2</configVersion>
    <userRemoteConfigs>
      <hudson.plugins.git.UserRemoteConfig>
        <url>https://github.com/aws-samples/aws-database-acceleration-toolkit.git</url>
       
      </hudson.plugins.git.UserRemoteConfig>
    </userRemoteConfigs>
    <branches>
      <hudson.plugins.git.BranchSpec>
        <name>*/main</name>
      </hudson.plugins.git.BranchSpec>
    </branches>
    <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
    <submoduleCfg class="list"/>
    <extensions/>
  </scm>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers>
    <hudson.triggers.TimerTrigger>
      <spec>@daily</spec>
    </hudson.triggers.TimerTrigger>
  </triggers>
  <concurrentBuild>false</concurrentBuild>
  <builders>
    <javaposse.jobdsl.plugin.ExecuteDslScripts plugin="job-dsl@1.64">
      <targets>pipelines/seed_jobdsl.groovy</targets>
      <usingScriptText>false</usingScriptText>
      <sandbox>false</sandbox>
      <ignoreExisting>false</ignoreExisting>
      <ignoreMissingFiles>false</ignoreMissingFiles>
      <failOnMissingPlugin>false</failOnMissingPlugin>
      <unstableOnDeprecation>true</unstableOnDeprecation>
      <removedJobAction>DELETE</removedJobAction>
      <removedViewAction>DELETE</removedViewAction>
      <removedConfigFilesAction>IGNORE</removedConfigFilesAction>
      <lookupStrategy>JENKINS_ROOT</lookupStrategy>
    </javaposse.jobdsl.plugin.ExecuteDslScripts>
  </builders>
  <publishers/>
  <buildWrappers/>
</project>
EOF

sudo cat <<EOF >plugins.txt
credentials:1.25
git:2.4.2
git-client:1.19.5
github-api:1.72
github:1.17.1
groovy:1.29
icon-shim:2.0.3
jobConfigHistory:2.12
job-dsl:1.43
plain-credentials
plugin-usage-plugin
rebuild
scm-api
ssh-credentials
token-macro
EOF

sudo cat <<EOF >dockerfile
FROM jenkins/jenkins:lts
USER root
WORKDIR /home/root

sudo apt install awscli
RUN apt-get update

RUN apt-get install -y build-essential libssl-dev apt-utils
#ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Install Terraform
RUN mkdir bin \
    && apt-get install -y wget \
    && wget https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip \
    && unzip terraform_1.6.3_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && terraform --version

# Install JQ
USER root
RUN apt-get install -y jq

# Install sudo
RUN apt-get install -y sudo
RUN adduser jenkins sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# create the seed job which spawns all other jobs
RUN mkdir -p /usr/share/jenkins/ref/jobs/seed-job
COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

COPY disable-script-security.groovy /var/jenkins_home/init.groovy.d/disable-script-security.groovy

# Configure the Jenkins server with plugins and seed jobs.
#COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
RUN jenkins-plugin-cli --plugins "ansicolor authorize-project build-timeout cloudbees-folder configuration-as-code" \
    && jenkins-plugin-cli --plugins "credentials-binding email-ext envinject git github greenballs job-dsl kubernetes" \
    && jenkins-plugin-cli --plugins "matrix-auth parameterized-scheduler pipeline-build-step pipeline-model-definition" \
    && jenkins-plugin-cli --plugins "pipeline-stage-view rebuild timestamper workflow-cps-global-lib workflow-job ws-cleanup"

USER jenkins
EXPOSE 8080 50000
EOF

sudo docker build --no-cache -t  jenkins-docker .
sudo docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-docker jenkins-docker 
sudo systemctl status jenkins
sudo systemctl status docker
sudo systemctl start jenkins-docker
sudo docker ps


